<script>
  import { useNavigate, useLocation } from "svelte-navigator";
  import { jwtToken } from "../../store/globals";

  const navigate = useNavigate();
  const location = useLocation();

  //TODO check session backend also, so you can stay loggedin after a page refesh

  $: if (!$jwtToken) {
    navigate("/", {
      state: { from: $location.pathname },
      replace: true,
    });
  }
</script>

{#if $jwtToken}
  <slot />
{/if}
