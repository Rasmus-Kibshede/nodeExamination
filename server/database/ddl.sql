create table if not exists cores (
    core_name varchar(255) not null primary key,
    core_description text null,
    constraint cores_core_name_uindex unique (core_name)
);

create table if not exists houses (
    house_name varchar(255) not null primary key,
    house_description text not null,
    house_img_name varchar(255) null,
    constraint houses_house_name_uindex unique (house_name)
);

create table if not exists roles (
    role_id int not null primary key,
    role_name varchar(255) not null,
    role_description text null,
    constraint roles_role_id_uindex unique (role_id),
    constraint roles_role_name_uindex unique (role_name)
);

create table if not exists spells (
    spell_id int auto_increment primary key,
    spell_name varchar(255) not null,
    spell_description text not null,
    constraint spells_spell_name_uindex unique (spell_name)
);

create table if not exists woods (
    wood_name varchar(255) not null primary key,
    wood_description text null,
    constraint woods_wood_name_uindex unique (wood_name)
);

create table if not exists wands (
    wand_id int auto_increment primary key,
    wand_name varchar(255) not null,
    wand_core varchar(255) not null,
    wand_wood varchar(255) not null,
    wand_length int not null,
    constraint wands_cores_core_name_fk foreign key (wand_core) references cores (core_name),
    constraint wands_woods_wood_name_fk foreign key (wand_wood) references woods (wood_name)
);

create table if not exists users (
    user_id int auto_increment primary key,
    user_firstname varchar(255) not null,
    user_lastname varchar(255) not null,
    user_email varchar(255) not null,
    user_password varchar(255) not null,
    fk_wand_id int null,
    fk_role_id int default 2 not null,
    user_house varchar(255) null,
    constraint users_houses_house_name_fk foreign key (user_house) references houses (house_name),
    constraint users_roles_role_id_fk foreign key (fk_role_id) references roles (role_id),
    constraint users_wands_wand_id_fk foreign key (fk_wand_id) references wands (wand_id) on update cascade
);

create table if not exists users_spells (
    fk_user_id int not null,
    fk_spell_id int not null,
    constraint unique_users_spells unique (fk_user_id, fk_spell_id),
    constraint users_spells_spells_spell_id_fk foreign key (fk_spell_id) references spells (spell_id),
    constraint users_spells_users_user_id_fk foreign key (fk_user_id) references users (user_id) on update cascade on delete cascade
);

/* ---------------- Role TABLE ---------------- */
INSERT INTO
    roles (role_id, role_name, role_description)
VALUES
    (1, 'Admin', 'All permissions');

INSERT INTO
    roles (role_id, role_name, role_description)
VALUES
    (2, 'Normal', 'Normal user permissions');

/* ---------------- HOUSE TABLE ---------------- */
INSERT INTO
    houses (house_name, house_description, house_img_name)
VALUES
    (
        'Gryffindor',
        'Gryffindor valued bravery, daring, nerve, and chivalry. Its emblematic
        animal was the lion, it''s representative gemstone was rubies, and its
        colours were scarlet and gold. Minerva McGonagall was the most recent
        Head of Gryffindor. Sir Nicholas de Mimsy-Porpington, also known as
        "Nearly Headless Nick", was the House Ghost. The founder of the House
        was Godric Gryffindor. Gryffindor corresponded to the element of fire.
        The common room was located in one of the highest towers at Hogwarts,
        the entrance was situated on the seventh floor in the east wing of the
        castle and was guarded by a portrait of The Fat Lady. She permitted
        entrance if given the correct password, which was changed numerous times
        throughout the school year. Famous Gryffindors included Albus
        Dumbledore, Harry Potter, and Minerva McGonagall. The significant object
        of Gryffindor was the Sword of Gryffindor. Their motto was "Forti Animo
        Estote".',
        'Gryffindor.png'
    );

INSERT INTO
    houses (house_name, house_description, house_img_name)
VALUES
    (
        'Hufflepuff',
        'Hufflepuff valued hard work, dedication, patience, loyalty, and fair
        play. Its emblematic animal was the badger, it''s representative gemstone
        was yellow diamonds, and yellow and black were its colours. Pomona
        Sprout was the Head of Hufflepuff during 1991–1998, Sprout left the post
        of Head of Hufflepuff and Herbology Professor sometime before 2017 and
        her successor for the position of Head of Hufflepuff was currently
        unknown. The Fat Friar was its ghost. The founder of the House was Helga
        Hufflepuff. Hufflepuff corresponded to the element of earth. The
        Hufflepuff dormitories and common room were located somewhere in the
        basement, near the castle''s kitchens. It could be accessed by tapping
        the barrel two from the bottom, middle of the second row in the rhythm
        of "Helga Hufflepuff" and was described as being a cosy and welcoming
        place with yellow hangings, fat armchairs, and underground tunnels that
        led to the dormitories, which had perfectly round doors, similar to
        barrel tops. Famous Hufflepuffs included Hengist of Woodcroft (founder
        of Hogsmeade), Newt Scamander (author of Fantastic Beasts and Where to
        Find Them), and Artemisia Lufkin (first female Minister for Magic). The
        significant object of Hufflepuff was Helga Hufflepuff''s Cup, which was
        turned into a Horcrux by Tom Riddle.',
        'Hufflepuff.png'
    );

INSERT INTO
    houses (house_name, house_description, house_img_name)
VALUES
    (
        'Ravenclaw',
        'Ravenclaw valued intelligence, knowledge, curiosity, creativity and wit.
        Its emblematic animal was the eagle, it''s representative gemstone was
        sapphires, and its colours were blue and bronze. The Ravenclaw Head of
        House in the 1990s was Filius Flitwick. The ghost of Ravenclaw was the
        Grey Lady, who was the daughter of Rowena Ravenclaw, the House''s
        founder. Ravenclaw corresponded to the element of air. The Ravenclaw
        common room and dormitories were located in a tower on the west side of
        the castle. Ravenclaw students must answer a riddle as opposed to giving
        a password to enter their dormitories. This riddle, however, could be
        answered by non-Ravenclaws. Famous Ravenclaws included Luna Lovegood,
        Gilderoy Lockhart, Ignatia Wildsmith (inventor of Floo powder), and
        Garrick Ollivander. The significant object of Ravenclaw was Rowena
        Ravenclaw''s diadem, which was turned into a Horcrux by Tom Riddle.',
        'Ravenclaw.png'
    );

INSERT INTO
    houses (house_name, house_description, house_img_name)
VALUES
    (
        'Slytherin',
        'Slytherin valued ambition, leadership, self-preservation, cunning and
        resourcefulness and was founded by Salazar Slytherin. Its emblematic
        animal was the serpent, it''s representative gemstone was emeralds, and
        its colours were emerald green and silver. Professor Horace Slughorn was
        the Head of Slytherin during the 1997–1998 school year, replacing
        Severus Snape, who as well replaced Slughorn as Potions Professor when
        he retired for the first time several years prior. Slytherin had
        produced the most Death Eaters and Dark wizards, including Tom Riddle,
        Bellatrix Lestrange and Lucius Malfoy, for example. But that does not
        mean that other Houses hadn''t produced any; Peter Pettigrew was a
        Gryffindor, and Quirinus Quirrell was a Ravenclaw. The Bloody Baron was
        the House ghost. The founder of the House was Salazar Slytherin.
        Slytherin corresponded roughly to the element of water. The Slytherin
        dormitories and common room were reached through a bare stone wall in
        the Dungeons. The Slytherin common room lay beneath the Black Lake. It
        was a long, low underground room with rough stone walls and silver lamps
        hanging from the ceiling. Famous Slytherins included Merlin, Tom Riddle,
        Draco Malfoy, and Dolores Umbridge. The significant object of Slytherin
        was Salazar Slytherin''s locket, which was turned into a Horcrux by Tom
        Riddle.',
        'Slytherin.png'
    );

/* ---------------- SPELLS TABLE ---------------- */
INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Aberto', 'Opens locked doors');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Accio', 'Summons objects');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Aguamenti', 'Summons water');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Alohomora', 'Unlocks objects');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Anapneo', 'Clears someone''s airway');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Aparecium', 'Reveals secret written messages');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Apparate',
        'A non-verbal transportation spell that allows a witch or wizard to instantly travel on the spot and appear at another location (disapparate is the opposite)'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Ascendio', 'Propells someone into the air');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Avada Kedavra',
        'Also known as The Killing Curse, the most evil spell in the Wizarding World; one of three Unforgivable Curses; Harry Potter is the only known witch or wizard to survive it'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Avis', 'Conjures a small flock of birds');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Bat',
        'Bogey Hex - Turns the target''s boogers into bats'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Bombardo', 'Creates an explosion');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Brackium Emendo', 'Heals broken bones');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Capacious Extremis',
        'Known as the Extension Charm, it''s a complicated spell that can greatly expand or extend the capacity of an object or space without affecting it externally'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Confundo',
        'Known as the Confundus Charm, it causes confusion of the target'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Conjunctivitis Curse',
        'Affects the eyes and sight of a target'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Crinus Muto', 'Changes hair color and style');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Crucio',
        'One of three Unforgivable Curses, it causes unbearable pain in the target'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Diffindo', 'Used to precisely cut an object');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Disillusionment Charm',
        'Causes the target to take on the appearance of its surroundings'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Disapparate',
        'A non-verbal transportation spell that allows a witch or wizard to instantly travel on the spot and leave for another location (apparate is the opposite)'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Engorgio',
        'Causes rapid growth in the targeted object'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Episkey', 'Heals minor injuries');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Expecto patronum',
        'The Patronus Charm is a powerful projection of hope and happiness that drives away Dementors; a corpeal Patronus takes the the respective animal form of the caster, while a non-corpeal appears as a wisp of light; at 13, Harry Potter was the youngest known witch or wizard to prouduce a corpeal Patronus'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Erecto',
        'Allows a witch or wizard to build a structure, like a tent'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Evanesco', 'Vanishes objects');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Expelliarmus',
        'Forces an opponent to drop whatever''s in their possession'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Ferula',
        'A healing charm that conjures wraps and bandages for wounds'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Fidelius Charm',
        'A complex charm that conceals a secret into the soul of a chosen "Secret Keeper". If a location is the subject of concealment, it becomes undetectable to others'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Fiendfyre Curse',
        'Conjures destructive, enormous enchanted flames'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Finite Incantatem',
        'A general counter-spell that''s used to reverse or counter already cast charms'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Furnunculus Curse',
        'A jinx that causes a breakout of boils or pimples'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Geminio', 'Duplicates objects');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Glisseo',
        'Transforms a staircase into a slide'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Homenum Revelio',
        'Reveals the presence of another person'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Homonculus Charm',
        'Detects anyone''s true identity and location on a piece of parchment; used to create the Marauder''s Map'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Immobulus', 'Immobilises living targets');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Impedimenta',
        'A temporary jinx that slows the movement of the target'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Incarcerous', 'Conjures ropes');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Imperio',
        'One of the three Unforgivable Curses, it places the target under the complete control of the caster'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Impervius', 'Makes an object waterproof');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Incendio', 'Conjures flames');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Langlock',
        'Causes the target''s tongue to stick to the roof of their mouth'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Legilimens',
        'Invading or navigating another''s mind'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Levicorpus',
        'Levitates the target by their ankle'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Locomotor Mortis',
        'The Leg-Locker curse bounds the target''s legs'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Lumos', 'Illuminates the caster''s wand');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Morsmordre',
        'Conjures and projects Lord Voldemort''s Dark Mark'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Mucus Ad Nauseam',
        'Inflicts an extreme runny nose or cold'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Muffliato',
        'Creates a buzzing sound in the target''s ears to prevent eavesdropping'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Nox',
        'Reverses the lumos charm, extinguishing a wand''s light'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Obliviate', 'Erases the target''s memory');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Obscuro', 'Conjures a blindfold');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Oculus Reparo', 'Repairs eyeglasses');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Oppugno',
        'Directs an object or person to attack a victim'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Petrificus Totalus',
        'Temporarily freezes or petrifies the body of the target'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Periculum', 'Conjures flares/red sparks');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Piertotum Locomotor',
        'Incantation used to bring to life inanimate objects and artifacts'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Protean Charm',
        'Links objects together for better communication'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Protego',
        'Casts an invisible shield around the caster, protecting against spells and objects (except for The Killing Curse)'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Reducto', 'Reduces the target to pieces');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Reducio',
        'Shrinks an enlarged object to its regular size'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Renneverate', 'Awakens or revives the target');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Reparifors',
        'Heals magical ailments like poisoning or paralysis'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Reparo', 'Fixes broken objects');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Rictusempra',
        'A charm that disarms an opponent by tickling them'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Riddikulus',
        'Used to defeat a Boggart, the charm allows the scary creature to assume a comedic form, disarming it'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Scourgify', 'Cleans objects');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Sectumsempra',
        'Inflicts severe lacerations and haemorrhaging on the target'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Serpensortia', 'Conjures a live snake');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Silencio', 'Silences the target');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Sonorus',
        'Amplifies the witch or wizard''s voice'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    ('Spongify', 'Softens the target');

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Stupefy',
        'The Stunning spell freezes objects and renders living targets unconscious'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Wingardium Leviosa',
        'Causes an object to levitate; but remember what Hermione said: "It''s Wing-gar-dium Levi-o-sa, make the ''gar'' nice and long.''"'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Tarantallegra',
        'Aimed at the legs, causes uncontrollable dancing movement'
    );

INSERT INTO
    spells (spell_name, spell_description)
VALUES
    (
        'Unbreakable Vow',
        'A magically binding contract that results in the death of whoever breaks it'
    );

INSERT INTO
    users (
        user_firstname,
        user_lastname,
        user_email,
        user_password,
        fk_wand_id,
        fk_role_id,
        user_house
    )
VALUES
    (
        'Rasmus',
        'Kibshede',
        'ralle@gmail.com',
        '$2b$12$p8PK3MK4JUkWQ650cuA6BuJaASos.tksTFLw3KAfAh/2gLokz/PbW',
        null,
        1,
        null
    );