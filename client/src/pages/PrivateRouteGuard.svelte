<script>
  import { useNavigate, useLocation } from "svelte-navigator";
  import { jwtToken } from "../../store/globals.js";

  const navigate = useNavigate();
  const location = useLocation();

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
