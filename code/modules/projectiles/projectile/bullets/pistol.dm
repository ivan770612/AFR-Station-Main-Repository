// 9mm (Stechkin APS)

/obj/projectile/bullet/c9mm
	name = "9mm bullet"
	damage = 20

/obj/projectile/bullet/c9mm_ap
	name = "9mm armor-piercing bullet"
	damage = 15
	armour_penetration = 40

/obj/projectile/bullet/incendiary/c9mm
	name = "9mm incendiary bullet"
	damage = 10
	fire_stacks = 1

// 10mm (Stechkin)

/obj/projectile/bullet/c10mm
	name = "10mm bullet"
	damage = 30

/obj/projectile/bullet/c10mm_ap
	name = "10mm armor-piercing bullet"
	damage = 27
	armour_penetration = 40

/obj/projectile/bullet/c10mm_hp
	name = "10mm hollow-point bullet"
	damage = 40
	armour_penetration = -50

/obj/projectile/bullet/incendiary/c10mm
	name = "10mm incendiary bullet"
	damage = 15
	fire_stacks = 2

/obj/projectile/bullet/c10mm_sleepy
	name = "10mm soporific bullet"
	damage = 0

/obj/projectile/bullet/c10mm_sleepy/on_hit(atom/target, blocked = FALSE)
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.Sleeping(400)
	return ..()

/obj/projectile/bullet/c10mm_para
	name = "10mm parabellum bullet"
	damage = 40
	armour_penetration = 30