/datum/uplink_item/colab
	category = "Collaborative Gear"
	surplus = 0
	exclude_modes = list(/datum/game_mode/nuclear)
	cant_discount = TRUE

/* Stimpak */
/datum/uplink_item/stealthy_tools/stimpack
	name = "Syndicate Nano-Booster"
	desc = "Also known as the 'Call of Duty' this powerful cluster of medical nanites effectively heals all damage \
	over time. If you are injured simply get to cover and wait a while and your wounds will vanish before your eyes. \
	It's duration is roughly five minutes."
	item = /obj/item/reagent_containers/syringe/nanoboost
	cost = 5
	surplus = 90

/* Implants */
/datum/uplink_item/implants/adrenal
	name = "Combat Stimulant Implant"
	desc = "An implant injected into the body, and later activated at the user's will. It will inject a chemical \
			cocktail which has a very potent healing effect."
	item = /obj/item/storage/box/syndie_kit/imp_comstimms
	cost = 8
	player_minimum = 0 //Healing like this, while strong as heck, isn't going to help you murderbone like antistuns can.

/datum/uplink_item/implants/mindslave
	name = "Mindslave Implant"
	desc = "An implant injected into another body, forcing the victim to obey any command by the user for around 15 to 20 mintues."
	exclude_modes = list(/datum/game_mode/nuclear)
	item = /obj/item/storage/box/syndie_kit/imp_mindslave
	cost = 6
	surplus = 20

/datum/uplink_item/implants/greatermindslave
	name = "Greater Mindslave Implant"
	desc = "An implant injected into another body, forcing the victim to obey any command by the user, it does not expire like a regular mindslave implant."
	item = /obj/item/storage/box/syndie_kit/imp_gmindslave
	cost = 10

/* Botany */
/datum/uplink_item/role_restricted/lawnmower
	name = "Gas powered lawn mower"
	desc = "A lawn mower is a machine utilizing one or more revolving blades to cut a grass surface to an even height, or bodies if that's your thing"
	restricted_roles = list("Botanist")
	cost = 14
	item = /obj/vehicle/lawnmower/emagged

/datum/uplink_item/dangerous/echainsaw
	name = "Energy Chainsaw"
	desc = "An incredibly deadly modified chainsaw with plasma-based energy blades instead of metal and a slick black-and-red finish. While it rips apart matter with extreme efficiency, it is heavy, large, and monstrously loud."
	item = /obj/item/twohanded/required/chainsaw/energy
	cost = 14

/* Glock */
/datum/uplink_item/dangerous/g17
	name = "Glock 17 Handgun"
	desc = "A simple yet popular handgun chambered in 9mm. Made out of strong but lightweight polymer. The standard magazine can hold up to 14 9mm cartridges. Compatible with a universal suppressor."
	item = /obj/item/gun/ballistic/automatic/pistol/g17
	cost = 10
	surplus = 15

/datum/uplink_item/ammo/g17
	name = "9mm Handgun Magazine"
	desc = "An additional 14-round 9mm magazine; compatible with the Glock 17 pistol."
	item = /obj/item/ammo_box/magazine/g17
	cost = 1

/datum/uplink_item/dangerous/revolver
	cost = 10
	surplus = 45

/datum/uplink_item/nukeoffer/blastco
	name = "Unlock the BlastCo(tm) Armory"
	desc = "Enough gear to fully equip a team with explosive based weaponry."
	item = /obj/item/paper
	cost = 200

/datum/uplink_item/nukeoffer/blastco/spawn_item(turf/loc, datum/component/uplink/U, mob/user)
	LAZYINITLIST(blastco_doors)
	if(LAZYLEN(blastco_doors))
		for(var/V in blastco_doors)
			var/obj/machinery/door/poddoor/shutters/blastco/X = V
			X.open()
		loc.visible_message("<span class='notice'>The Armory has been unlocked successfully!</span>")
	else
		loc.visible_message("<span class='warning'>The purchase was unsuccessful, and spent telecrystals have been refunded.</span>")
		U.telecrystals += cost //So the admins don't have to refund you
	return

/datum/uplink_item/role_restricted/firesuit_syndie
	name = "Syndicate Firesuit"
	desc = "A less heavy, armored version of the common firesuit developed by a now-defunct, \
	Syndicate-affiliated collective with a penchant for arson. It offers complete fireproofing, \
	spaceproofing, the added bonus of not slowing the wearer while equipped and it fits into any backpack. \
	Comes in conspicuous red/orange colors. Helmet included."
	cost = 4
	item = /obj/item/storage/box/syndie_kit/firesuit/
	restricted_roles = list("Atmospheric Technician")

/datum/uplink_item/role_restricted/fire_axe
	name = "Fire Axe"
	desc = "A rather blunt fire axe recovered from the burnt out wreck of an old space station. \
	Warm to the touch, this axe will set fire to anyone struck with it as long as you hold it with\
	two hands. The more you strike them, the hotter they burn, it will deal bonus fire damage to lit\
	targets and will enable you to shoot gouts of fire that will set them ablaze. It will also apply thermite to\
	standard walls and ignite them on a second hit."
	cost = 10
	item = /obj/item/twohanded/fireaxe/fireyaxe
	restricted_roles = list("Atmospheric Technician")

/datum/uplink_item/role_restricted/retardhorn
	name = "Extra Annoying Bike Horn."
	desc = "This bike horn has been carefully tuned by the clown federation to subtly affect the brains of those who\
	 hear it using advanced sonic techniques. To the untrained eye, a golden bike horn but each honk will cause small\
	  amounts of brain damage, most targets will be reduced to a gibbering wreck before they catch on."
	cost = 5
	item = /obj/item/bikehorn/golden/retardhorn
	restricted_roles = list("Clown")

/datum/uplink_item/ammo/pistol
	desc = "An additional 8-round 10mm magazine; compatible with the Stechkin Pistol. These \
			are dirt cheap but aren't as effective as .357 rounds."

/datum/uplink_item/ammo/revolver
	cost = 2

/datum/uplink_item/dangerous/butterfly
	name = "Energy Butterfly Knife"
	desc = "A highly lethal and concealable knife that causes critical backstab damage when used with harm intent."
	cost = 8//80 backstab damage and armour pierce isn't a fucking joke
	item = /obj/item/melee/transforming/butterfly/energy
	surplus = 15

/datum/uplink_item/dangerous/beenade
	name = "Bee delivery grenade"
	desc = "This grenade is filled with several random posionous bees. Fun for the whole family!"
	cost = 2
	item = /obj/item/grenade/spawnergrenade/beenade
	surplus = 30

/datum/uplink_item/dangerous/gremlin
	name = "Gremlin delivery grenade"
	desc = "This grenade is filled with several gremlins. Fun for RnD and engineering!"
	cost = 2
	item = /obj/item/grenade/spawnergrenade/gremlin
	surplus = 30

/datum/uplink_item/dangerous/cat
	name = "Feral cat grenade"
	desc = "This grenade is filled with 5 feral cats in stasis. Upon activation, the feral cats are awoken and unleashed unto unlucky bystanders."
	cost = 3
	item = /obj/item/grenade/spawnergrenade/cat
	surplus = 30

/datum/uplink_item/stealthy_tools/chameleon
	cost = 4
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/traitor)
	player_minimum = 0

/datum/uplink_item/stealthy_tools/syndigaloshes
	item = /obj/item/clothing/shoes/chameleon
	cost = 2
	player_minimum = 0

/datum/uplink_item/stealthy_tools/syndigaloshes/nuke
	cost = 2
	player_minimum = 0

/datum/uplink_item/stealthy_tools/mulligan
	cost = 2

/datum/uplink_item/device_tools/syndietome
	cost = 5

/datum/uplink_item/device_tools/binary
	cost = 2

/datum/uplink_item/device_tools/singularity_beacon
	cost = 8

/datum/uplink_item/device_tools/syndicate_bomb
	cost = 10

/datum/uplink_item/device_tools/syndicate_detonator
	cost = 1 //Nuke ops already spawn with one

/datum/uplink_item/device_tools/jammer
	cost = 3

/datum/uplink_item/device_tools/autosurgeon
	name = "Autosurgeon"
	desc = "A surgery device that instantly implants you with whatever implant has been inserted in it. Infinite uses. Use a screwdriver to remove an implant from it."
	item = /obj/item/device/autosurgeon
	cost = 1
	surplus = 60

/datum/uplink_item/implants/microbomb
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/traitor)

/datum/uplink_item/implants/macrobomb
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/traitor)

/datum/uplink_item/dangerous/hockey
	name = "Ka-nada Hockey Set"
	desc = "Become one of the legends of the most brutal game in space. The items cannot be taken off once you wear them."
	item = /obj/item/storage/box/syndie_kit/hockey
	cost = 20
	exclude_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/dangerous/bowling
	name = "Bowling Set"
	desc = "Niko, it's me, your cousin! Let's go bowling."
	item = /obj/item/storage/box/syndie_kit/bowling
	cost = 12
	exclude_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/dangerous/wrestling
	name = "Wrestling Set"
	desc = "OH YEAH BROTHERRRR!"
	item = /obj/item/storage/box/syndie_kit/wrestling
	cost = 8 //The wrestling set is not as powerful as it once was
	exclude_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/badass/execution_sword
	name = "Executioners Sword"
	desc = "This modified energy sword has been specially designed to cleanly remove the head of a human\
			 being in one well aimed swipe. It contains a little hacked transmitter that will broadcast the\
			 details of your gruesome execution on the Centcom announcement channel so everyone will know the\
			 name of the filthy pig you are about to slaughter. You may dedicate your executions to whomever you\
			 please by using the device in hand but you may only do so once. Be warned that you must remain still\
			 for a long time to execute a target so be sure to have them restrained and if you should be interrupted\
			 then news of your failure will be broadcast to the station."
	item = /obj/item/melee/execution_sword
	cost = 1 //Its weaker than an energy dagger and cannot be concealed.
	surplus = 30 //Theres a good chance this will end up in surplus crates, so its a great way to add a little spice to any meme round.

/datum/uplink_item/dangerous/guardian
	surplus = 5 //Up yours TGbalanceing
	player_minimum = 0

/datum/uplink_item/colab/romerol_kit
	name = "Romerol"
	desc = "A highly experimental bioterror agent which creates dormant nodules to be etched into the grey matter of the brain. On death, these nodules take control of the dead body, causing limited revivification, along with slurred speech, aggression, and the ability to infect others with this agent."
	item = /obj/item/storage/box/syndie_kit/romerol
	cost = 25
	surplus = 5

/datum/uplink_item/stealthy_weapons/romerol_kit
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/traitor)

/datum/uplink_item/badass/banhammer
	name = "Banhammer"
	desc = "Mimick an imperfect version of god's wrath with this unholy weapon. Found in an abandoned bus."
	item = /obj/item/banhammer
	cost = 1
	surplus = 40

/datum/uplink_item/dangerous/syndiebanhammer
	name = "Syndicate Banhammer"
	desc = "By inserting small kinetic pounders into a banhammer, the banhammer becomes a dangerous object that is able to kill people before they even realize what happened. Completely stealthy unless someone examines it. Don't try this at home."
	item = /obj/item/banhammer/syndicate
	cost = 10
	surplus = 10
	exclude_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/badass/surplus
	player_minimum = 0

/datum/uplink_item/badass/rapid
	name = "Gloves of the North Star"
	desc = "These gloves let the user punch people very fast. Incompatible with weaponry or the hulk mutation."
	item = /obj/item/clothing/gloves/fingerless/rapid
	cost = 8

/datum/uplink_item/device_tools/syndietome
	name = "Syndicate Tome"
	desc = "Using rare artifacts acquired at great cost, the syndicate has reverse engineered \
			the seemingly magical books of a certain cult. Though lacking the esoteric abilities \
			of the originals, these inferior copies are still quite useful, being able to provide \
			both weal and woe on the battlefield, even if they do occasionally bite off a finger."
	item = /obj/item/storage/book/bible/syndicate
	cost = 2

/datum/uplink_item/device_tools/binary
	name = "Binary Translator Key"
	desc = "A key that, when inserted into a radio headset, allows you to listen to and talk with silicon-based lifeforms, \
			such as AI units and cyborgs, over their private binary channel. Caution should \
			be taken while doing this, as unless they are allied with you, they are programmed to report such intrusions."
	item = /obj/item/device/encryptionkey/binary
	cost = 2
	surplus = 75

/datum/uplink_item/device_tools/codespeak_manual
	name = "Codespeak Manual"
	desc = "Syndicate agents can be trained to use a series of codewords to convey complex information, which makes you look like an obvious traitor to anyone listening. This manual teaches you this Codespeak. You can also hit someone else with the manual in order to teach them. One use."
	item = /obj/item/codespeak_manual
	cost = 0
	limited_stock = 4
	exclude_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/device_tools/codespeak_manual_deluxe
	name = "Deluxe Codespeak Manual"
	desc = "Syndicate agents can be trained to use a series of codewords to convey complex information, which makes you look like an obvious traitor to anyone listening. This manual teaches you this Codespeak. You can also hit someone else with the manual in order to teach them. This is the deluxe edition, which has unlimited uses. Now you and your club can get lynched together!"
	cost = 3
	include_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/stealthy_weapons/martialarts
	name = "Martial Arts Scroll"
	desc = "This scroll contains the secrets of an ancient martial arts technique. You will master unarmed combat, \
			deflecting all ranged weapon fire, but you also refuse to use dishonorable ranged weaponry."
	item = /obj/item/sleeping_carp_scroll
	cost = 12
	surplus = 0
	exclude_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/stealthy_weapons/throwingweapons
	name = "Box of Throwing Weapons"
	desc = "A box of shurikens and reinforced bolas from ancient Earth martial arts. They are highly effective \
			 throwing weapons. The bolas can knock a target down and the shurikens will embed into limbs."
	item = /obj/item/storage/box/syndie_kit/throwing_weapons
	cost = 2

/datum/uplink_item/stealthy_weapons/dart_pistol
	name = "Dart Pistol"
	desc = "A miniaturized version of a normal syringe gun. It is very quiet when fired and can fit into any \
			space a small item can."
	item = /obj/item/gun/syringe/syndicate
	cost = 3
	surplus = 50

/datum/uplink_item/suits/hardsuit
	name = "Syndicate Hardsuit"
	desc = "The feared suit of a syndicate nuclear agent. Features slightly better armoring and a built in jetpack \
			that runs off standard atmospheric tanks. When the built in helmet is deployed your identity will be \
			protected, even in death, as the suit cannot be removed by outside forces. Toggling the suit in and out of \
			combat mode will allow you all the mobility of a loose fitting uniform without sacrificing armoring. \
			Additionally the suit is collapsible, making it small enough to fit within a backpack. \
			Nanotrasen crew who spot these suits are known to panic."
	item = /obj/item/clothing/suit/space/hardsuit/syndi
	cost = 7
	exclude_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/device_tools/surgerybag
	name = "Syndicate Surgery Duffel Bag"
	desc = "The Syndicate surgery duffel bag is a toolkit containing all surgery tools, surgical drapes, \
			a Syndicate brand MMI, a straitjacket, and a muzzle."
	item = /obj/item/storage/backpack/duffelbag/syndie/surgery
	cost = 1

/datum/uplink_item/role_restricted/ancient_jumpsuit
	name = "Ancient Jumpsuit"
	desc = "A tattered old jumpsuit that will provide absolutely no benefit to you. It fills the wearer with a strange compulsion to blurt out 'glorf'."
	item = /obj/item/clothing/under/color/grey/glorf
	cost = 0
	limited_stock = 4
	restricted_roles = list("Assistant")
	surplus = 0

/datum/uplink_item/role_restricted/reverse_revolver
	name = "Reverse Revolver"
	desc = "A revolver that always fires at its user. \"Accidentally\" drop your weapon, then watch as the greedy corporate pigs blow their own brains all over the wall. \
	The revolver itself is actually real. Only clumsy people, and clowns, can fire it normally. Comes in a box of hugs. Honk."
	cost = 13
	item = /obj/item/storage/box/hug/reverse_revolver
	restricted_roles = list("Clown")