
/datum/symptom/heal

	name = "Toxic Filter"
	stealth = 1
	resistance = -2
	stage_speed = -2
	transmittable = -2
	level = 4

/datum/symptom/heal/Activate(datum/disease/advance/A)
	..()
	 //100% chance to activate for slow but consistent healing
	var/mob/living/M = A.affected_mob
	switch(A.stage)
		if(4, 5)
			Heal(M, A)
	return

/datum/symptom/heal/proc/Heal(mob/living/M, datum/disease/advance/A)
	var/heal_amt = 0.5
	if(M.toxloss > 0 && prob(20))
		new /obj/effect/overlay/temp/heal(get_turf(M), "#66FF99")
	M.adjustToxLoss(-heal_amt)
	return 1

/datum/symptom/heal/plus

	name = "Apoptoxin filter"
	stealth = 0
	resistance = -2
	stage_speed = -2
	transmittable = -2
	level = 6

/datum/symptom/heal/plus/Heal(mob/living/M, datum/disease/advance/A)
	var/heal_amt = 1
	if(M.toxloss > 0 && prob(20))
		new /obj/effect/overlay/temp/heal(get_turf(M), "#00FF00")
	M.adjustToxLoss(-heal_amt)
	return 1

/datum/symptom/heal/brute

	name = "Regeneration"
	stealth = 1
	resistance = -2
	stage_speed = -2
	transmittable = -2
	level = 4

/datum/symptom/heal/brute/Heal(mob/living/carbon/M, datum/disease/advance/A)
	var/heal_amt = 1

	var/list/parts = M.get_damaged_bodyparts(1,1) //1,1 because it needs inputs.

	if(!parts.len)
		return

	for(var/obj/item/bodypart/L in parts)
		if(L.heal_damage(heal_amt/parts.len, 0))
			M.update_damage_overlays()

	if(prob(20))
		new /obj/effect/overlay/temp/heal(get_turf(M), "#FF3333")

	return 1

/datum/symptom/heal/brute/plus

	name = "Flesh Mending"
	stealth = 0
	resistance = 0
	stage_speed = -2
	transmittable = -2
	level = 6

/datum/symptom/heal/brute/plus/Heal(mob/living/carbon/M, datum/disease/advance/A)
	var/heal_amt = 2

	var/list/parts = M.get_damaged_bodyparts(1,1) //1,1 because it needs inputs.

	if(M.getCloneLoss() > 0)
		M.adjustCloneLoss(-1)
		M.take_bodypart_damage(0, 1) //Deals BURN damage, which is not cured by this symptom
		new /obj/effect/overlay/temp/heal(get_turf(M), "#33FFCC")

	if(!parts.len)
		return

	for(var/obj/item/bodypart/L in parts)
		if(L.heal_damage(heal_amt/parts.len, 0))
			M.update_damage_overlays()

	if(prob(20))
		new /obj/effect/overlay/temp/heal(get_turf(M), "#CC1100")

	return 1

/datum/symptom/heal/burn

	name = "Tissue Regrowth"
	stealth = 1
	resistance = -2
	stage_speed = -2
	transmittable = -2
	level = 6

/datum/symptom/heal/burn/Heal(mob/living/carbon/M, datum/disease/advance/A)
	var/heal_amt = 1

	var/list/parts = M.get_damaged_bodyparts(1,1) //1,1 because it needs inputs.

	if(!parts.len)
		return

	for(var/obj/item/bodypart/L in parts)
		if(L.heal_damage(0, heal_amt/parts.len))
			M.update_damage_overlays()

	if(prob(20))
		new /obj/effect/overlay/temp/heal(get_turf(M), "#FF9933")
	return 1

/datum/symptom/heal/burn/plus

	name = "Heat Resistance"
	stealth = 0
	resistance = 0
	stage_speed = -2
	transmittable = -2
	level = 4

/datum/symptom/heal/burn/plus/Heal(mob/living/carbon/M, datum/disease/advance/A)
	var/heal_amt = 2

	var/list/parts = M.get_damaged_bodyparts(1,1) //1,1 because it needs inputs.

	if(M.bodytemperature > 310)
		M.bodytemperature = max(310, M.bodytemperature - (10 * heal_amt * TEMPERATURE_DAMAGE_COEFFICIENT))
	else if(M.bodytemperature < 311)
		M.bodytemperature = min(310, M.bodytemperature + (10 * heal_amt * TEMPERATURE_DAMAGE_COEFFICIENT))

	if(!parts.len)
		return

	for(var/obj/item/bodypart/L in parts)
		if(L.heal_damage(0, heal_amt/parts.len))
			M.update_damage_overlays()

	if(prob(20))
		new /obj/effect/overlay/temp/heal(get_turf(M), "#CC6600")
	return 1

/datum/symptom/heal/dna

	name = "Deoxyribonucleic Acid Restoration"
	stealth = -1
	resistance = -1
	stage_speed = 0
	transmittable = -1
	level = 5

/datum/symptom/heal/dna/Heal(mob/living/carbon/M, datum/disease/advance/A)
	var/amt_healed = 1
	M.adjustBrainLoss(-amt_healed)
	//Non-power mutations, excluding race, so the virus does not force monkey -> human transformations.
	var/list/unclean_mutations = (not_good_mutations|bad_mutations) - mutations_list[RACEMUT]
	M.dna.remove_mutation_group(unclean_mutations)
	M.radiation = max(M.radiation - (2 * amt_healed), 0)
	return 1
