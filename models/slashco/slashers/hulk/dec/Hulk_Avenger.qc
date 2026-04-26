// Created by Crowbar 0.74

$modelname "Hulk_Avenger.mdl"

$bodygroup "mybody"
{
	studio "hulk.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition 11.712 -11.265 252.473

$cdmaterials "models\marvel\hulk\"

$texturegroup "skinfamilies"
{
	{ "hulk_avengers_maskedmat_unhulk"  }
	{ "hulk_avengers_maskedmat_unhulk2" }
}

$attachment "L_Hand" "g_l_palm" -6.05 0 -5.5 rotate 0 0 0
$attachment "R_Hand" "g_r_palm" 6.05 0 -5.5 rotate 0 0 0
$attachment "Throwable_attach" "g_throwable_attach_offset" 0 0 0 rotate 0 0 0
$attachment "L_eye" "g_l_eye" -1.7 0 0 rotate 0 0 0
$attachment "R_eye" "g_r_eye" -1.71 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -49.984 -74.688 -14.401 72.514 98.112 519.348

$definebone "root" "" 0 0 0 0 89.999982 0 0 0 0 0 0 0
$definebone "g_r_hip_offset" "root" -10.521344 -5.760963 66.994621 -2.902183 -179.870573 177.445296 0 0 0 0 0 0
$definebone "g_r_hip" "g_r_hip_offset" -3.542706 2.539814 16.96962 29.441312 22.55471 -2.652107 0 0 0 0 0 0
$definebone "g_r_knee" "g_r_hip" -0.000034 0.000012 24.761454 -7.314444 -13.453908 -63.055842 0 0 0 0 0 0
$definebone "g_r_ankle" "g_r_knee" 0.000017 0 24.344809 -9.62248 -8.711886 98.405274 0 0 0 0 0 0
$definebone "g_r_ball" "g_r_ankle" 0.002333 -1.019846 24.031336 -2.617392 -0.303324 50.450533 0 0 0 0 0 0
$definebone "g_r_thightwist" "g_r_hip" 0.000034 0.000008 13.404741 -0.000522 -7.991157 -0.000056 0 0 0 0 0 0
$definebone "g_l_hip_offset" "root" 10.398263 -5.760962 66.994675 2.902183 179.870573 177.445296 0 0 0 0 0 0
$definebone "g_l_hip" "g_l_hip_offset" 0.546725 -6.957888 18.108223 -36.416154 18.158183 47.913186 0 0 0 0 0 0
$definebone "g_l_knee" "g_l_hip" -0.000004 -0.000006 24.761459 11.964274 -41.05054 -103.264435 0 0 0 0 0 0
$definebone "g_l_ankle" "g_l_knee" -0.000007 0.000004 24.344891 5.587949 -5.560843 101.651499 0 0 0 0 0 0
$definebone "g_l_ball" "g_l_ankle" -0.00236 -1.019903 24.03133 -2.446246 -0.986583 22.322072 0 0 0 0 0 0
$definebone "g_l_thightwist" "g_l_hip" 0 -0.000002 13.404737 0.000289 -21.834464 0.000048 0 0 0 0 0 0
$definebone "g_spine01_offset" "root" -0.06154 -5.245835 72.927078 0 0 0 0 0 0 0 0 0
$definebone "g_spine01" "g_spine01_offset" 1.567778 -2.557655 -17.715019 0.007105 -0.141234 -0.054316 0 0 0 0 0 0
$definebone "g_pelvis" "g_spine01" 0 -0.005608 -1.146812 3.874913 -26.758613 12.566744 0 0 0 0 0 0
$definebone "g_spine02_offset" "g_spine01" 0.03077 -0.24 8.906021 0 0 -0.23709 0 0 0 0 0 0
$definebone "g_spine02" "g_spine02_offset" -0.43749 -2.202336 -0.324627 -0.830158 -9.238715 19.705444 0 0 0 0 0 0
$definebone "g_spine03_offset" "g_spine02" 0.03077 -0.276858 8.90514 0.236862 -0.002806 3.215721 0 0 0 0 0 0
$definebone "g_spine03" "g_spine03_offset" 0.194053 -0.631956 0.018356 4.212556 -0.586479 19.073477 0 0 0 0 0 0
$definebone "g_l_clavical" "g_spine03" 5.669724 4.435303 14.302868 -79.09092 52.893846 153.161337 0 0 0 0 0 0
$definebone "g_l_shoulder" "g_l_clavical" -1.044571 -2.839317 19.743267 -43.706319 8.777612 -19.890739 0 0 0 0 0 0
$definebone "g_l_elbow" "g_l_shoulder" 2.655533 -1.533369 24.792658 4.753528 -13.019367 -28.218867 0 0 0 0 0 0
$definebone "g_l_forarm" "g_l_elbow" 1.120163 -0.154394 9.796035 -0.047922 -18.300618 -2.102874 0 0 0 0 0 0
$definebone "g_l_wrist" "g_l_elbow" 2.240311 -0.308786 19.592051 -4.499745 -35.789006 -8.237869 0 0 0 0 0 0
$definebone "g_l_birdy1" "g_l_wrist" 0.683151 2.877354 14.167051 -6.877165 79.104225 -10.256589 0 0 0 0 0 0
$definebone "g_l_birdy2" "g_l_birdy1" 0.144936 -0.145374 7.579252 -13.961377 11.434175 -90.362112 0 0 0 0 0 0
$definebone "g_l_birdy3" "g_l_birdy2" 0.09166 -0.906685 4.70285 -6.212582 2.141028 -38.920262 0 0 0 0 0 0
$definebone "g_l_index1" "g_l_wrist" 0.506271 8.500866 13.617253 10.130286 76.724963 4.354688 0 0 0 0 0 0
$definebone "g_l_index2" "g_l_index1" -0.384987 -0.460049 7.003448 -25.609487 18.610479 -65.327064 0 0 0 0 0 0
$definebone "g_l_index3" "g_l_index2" 0.561516 -0.596954 5.061852 -19.086422 11.280002 -55.98788 0 0 0 0 0 0
$definebone "g_l_pinky1" "g_l_wrist" -2.452171 -8.899406 11.597897 -20.541577 61.859049 -33.255177 0 0 0 0 0 0
$definebone "g_l_pinky2" "g_l_pinky1" 0.680496 -0.903999 6.074253 7.861369 0.454817 -70.800908 0 0 0 0 0 0
$definebone "g_l_pinky3" "g_l_pinky2" 0.245514 -0.66115 3.388004 6.005337 -1.778242 -35.777019 0 0 0 0 0 0
$definebone "g_l_ring1" "g_l_wrist" -0.717484 -3.784271 13.043911 -10.767088 78.357959 -38.780841 0 0 0 0 0 0
$definebone "g_l_ring2" "g_l_ring1" 1.099216 -1.407745 8.017889 1.207791 -0.22924 -77.534545 0 0 0 0 0 0
$definebone "g_l_ring3" "g_l_ring2" 0.068439 -0.807653 3.686054 0.540869 0.156757 -41.738193 0 0 0 0 0 0
$definebone "g_l_thumb1" "g_l_wrist" -4.004929 6.172707 4.754754 58.773716 166.667066 29.356559 0 0 0 0 0 0
$definebone "g_l_thumb2" "g_l_thumb1" 0.158352 -1.149811 5.804394 -10.914964 13.627863 -12.484424 0 0 0 0 0 0
$definebone "g_l_thumb3" "g_l_thumb2" -1.083523 -1.463142 5.544399 -21.09613 14.276609 -92.447737 0 0 0 0 0 0
$definebone "g_l_palm" "g_l_wrist" -6.289886 0.932434 13.569063 35.071314 164.416546 -7.265291 0 0 0 0 0 0
$definebone "g_l_biceptwist" "g_l_shoulder" 1.327774 -0.766687 12.396328 0.41286 -7.56481 -0.838531 0 0 0 0 0 0
$definebone "g_neck" "g_spine03" -0.09614 1.828087 23.185329 -3.767778 -89.890146 0.096429 0 0 0 0 0 0
$definebone "g_head" "g_neck" 2.325478 -0.000003 6.169296 1.602908 97.602044 -43.946796 0 0 0 0 0 0
$definebone "g_jaw" "g_head" 0 -3.152912 0.122169 0 -0.000001 116.804158 0 0 0 0 0 0
$definebone "g_l_brow" "g_head" 1.068383 -10.478592 7.066338 -73.471751 -179.999718 16.742923 0 0 0 0 0 0
$definebone "g_l_brow2" "g_l_brow" 0 0 2.279457 -19.684887 6.178362 31.348639 0 0 0 0 0 0
$definebone "g_l_eye" "g_head" 2.479414 -8.323895 6.074242 0.420652 89.488906 -0.507354 0 0 0 0 0 0
$definebone "g_topeyelid" "g_head" 0.000003 -5.07526 5.105362 0 -0.000001 0.000013 0 0 0 0 0 0
$definebone "g_r_brow" "g_head" -1.068383 -10.478611 7.065971 73.471751 179.999718 16.74293 0 0 0 0 0 0
$definebone "g_r_brow2" "g_r_brow" -0.000488 0.000015 2.2796 19.684884 6.178503 31.348581 0 0 0 0 0 0
$definebone "g_r_eye" "g_head" -2.479401 -8.323895 6.074234 0.42134 90.511044 0.507297 0 0 0 0 0 0
$definebone "g_r_clavical" "g_spine03" -5.79 4.432083 14.255558 80.530136 -16.897657 -165.834712 0 0 0 0 0 0
$definebone "g_r_shoulder" "g_r_clavical" 1.04454 -2.839314 19.743252 43.897394 -13.602142 -34.481158 0 0 0 0 0 0
$definebone "g_r_elbow" "g_r_shoulder" -2.65551 -1.533379 24.792648 -5.266965 27.634215 -36.370289 0 0 0 0 0 0
$definebone "g_r_forarm" "g_r_elbow" -1.120216 -0.154385 9.795983 -0.06147 8.486538 -0.97673 0 0 0 0 0 0
$definebone "g_r_wrist" "g_r_elbow" -2.240372 -0.308788 19.592047 9.451003 16.753581 -4.047611 0 0 0 0 0 0
$definebone "g_r_birdy1" "g_r_wrist" -0.683205 2.877342 14.167089 11.611905 -81.330853 -20.315783 0 0 0 0 0 0
$definebone "g_r_birdy2" "g_r_birdy1" -0.144958 -0.145317 7.579308 17.41 -9.24164 -87.102302 0 0 0 0 0 0
$definebone "g_r_birdy3" "g_r_birdy2" -0.038551 -0.936644 4.697678 12.170256 -5.679741 -60.937671 0 0 0 0 0 0
$definebone "g_r_index1" "g_r_wrist" -0.506317 8.500896 13.617329 -6.535098 -76.431599 -0.61468 0 0 0 0 0 0
$definebone "g_r_index2" "g_r_index1" 0.385056 -0.460075 7.003435 33.271706 -16.359155 -72.76902 0 0 0 0 0 0
$definebone "g_r_index3" "g_r_index2" -0.45636 -0.710276 5.057732 31.240537 -20.378636 -74.513498 0 0 0 0 0 0
$definebone "g_r_pinky1" "g_r_wrist" 2.452194 -8.899408 11.597939 25.141096 -66.658371 -52.577256 0 0 0 0 0 0
$definebone "g_r_pinky2" "g_r_pinky1" -0.680515 -0.903999 6.074242 -9.69313 -0.377923 -80.590174 0 0 0 0 0 0
$definebone "g_r_pinky3" "g_r_pinky2" -0.248295 -0.666843 3.386627 -6.953184 2.611769 -45.684513 0 0 0 0 0 0
$definebone "g_r_ring1" "g_r_wrist" 0.717491 -3.784309 13.04401 11.575348 -80.677621 -50.042549 0 0 0 0 0 0
$definebone "g_r_ring2" "g_r_ring1" -1.099228 -1.407673 8.017876 -1.138575 0.646638 -86.760464 0 0 0 0 0 0
$definebone "g_r_ring3" "g_r_ring2" -0.064053 -0.80764 3.6861 -0.169882 -0.413782 -32.840683 0 0 0 0 0 0
$definebone "g_r_thumb1" "g_r_wrist" 4.004906 6.17271 4.7548 -60.140499 -161.832235 26.974847 0 0 0 0 0 0
$definebone "g_r_thumb2" "g_r_thumb1" -0.158381 -1.149773 5.804405 6.473975 14.067658 -25.355107 0 0 0 0 0 0
$definebone "g_r_thumb3" "g_r_thumb2" 1.078559 -2.386406 5.215008 48.835692 -2.456316 -71.904898 0 0 0 0 0 0
$definebone "g_r_palm" "g_r_wrist" 6.289963 0.932404 13.569109 -35.070634 -164.416655 -7.265158 0 0 0 0 0 0
$definebone "g_r_biceptwist" "g_r_shoulder" -1.327759 -0.766682 12.396324 -0.749992 16.39272 -1.874448 0 0 0 0 0 0
$definebone "g_throwable_attach_offset" "root" 0.000017 -54.999996 0 0 -89.999982 0 0 0 0 0 0 0


$sectionframes 25 134

$poseparameter "move_yaw" -180 180 loop 0

$animation "Run1" "Hulk_Avenger_anims\Run1.smd" {
	fps 40
	loop
	walkframe 19 LX LY
}

$animation "Walk1" "Hulk_Avenger_anims\Walk1.smd" {
	fps 30
	loop
	walkframe 47 LX LY
}

$animation "attack_1" "Hulk_Avenger_anims\attack_1.smd" {
	fps 45
}

$animation "attack_2" "Hulk_Avenger_anims\attack_2.smd" {
	fps 45
}

$animation "attack_3" "Hulk_Avenger_anims\attack_3.smd" {
	fps 45
}

$animation "attack_4" "Hulk_Avenger_anims\attack_4.smd" {
	fps 45
}

$animation "attack_5" "Hulk_Avenger_anims\attack_5.smd" {
	fps 45
}

$animation "attack_6" "Hulk_Avenger_anims\attack_6.smd" {
	fps 45
}

$animation "attack_7" "Hulk_Avenger_anims\attack_7.smd" {
	fps 45
}

$animation "attack_8" "Hulk_Avenger_anims\attack_8.smd" {
	fps 45
}

$animation "attack_9" "Hulk_Avenger_anims\attack_9.smd" {
	fps 45
}

$animation "hulk no" "Hulk_Avenger_anims\hulk no.smd" {
	fps 30
}

$animation "hulk agree" "Hulk_Avenger_anims\hulk agree.smd" {
	fps 30
}

$animation "Wait a minute" "Hulk_Avenger_anims\Wait a minute.smd" {
	fps 30
}

$animation "Jump" "Hulk_Avenger_anims\Jump.smd" {
	fps 30
}

$animation "Jump2" "Hulk_Avenger_anims\Jump2.smd" {
	fps 30
}

$animation "Hulk Rampage" "Hulk_Avenger_anims\Hulk Rampage.smd" {
	fps 15
}

$animation "Hulk Salute" "Hulk_Avenger_anims\Hulk Salute.smd" {
	fps 30
}

$animation "Hulk Spawn" "Hulk_Avenger_anims\Hulk Spawn.smd" {
	fps 30
}

$animation "Hulk wins" "Hulk_Avenger_anims\Hulk wins.smd" {
	fps 30
}

$animation "Hulk wins2" "Hulk_Avenger_anims\Hulk wins2.smd" {
	fps 30
}

$animation "Hulk wins3" "Hulk_Avenger_anims\Hulk wins3.smd" {
	fps 30
}

$animation "Unknown_damage1" "Hulk_Avenger_anims\Unknown_damage1.smd" {
	fps 30
}

$animation "Unknown_damage2" "Hulk_Avenger_anims\Unknown_damage2.smd" {
	fps 30
}

$animation "Hulk_calls" "Hulk_Avenger_anims\Hulk_calls.smd" {
	fps 30
}

$animation "Hulk_Under_assault" "Hulk_Avenger_anims\Hulk_Under_assault.smd" {
	fps 30
}

$animation "Hulk_Heavy_bigpunch" "Hulk_Avenger_anims\Hulk_Heavy_bigpunch.smd" {
	fps 30
}

$animation "Hulk_brutal_strike" "Hulk_Avenger_anims\Hulk_brutal_strike.smd" {
	fps 45
}

$animation "Hulk close jump" "Hulk_Avenger_anims\Hulk close jump.smd" {
	fps 30
}

$animation "Hulk_Shockwave_Attack" "Hulk_Avenger_anims\Hulk_Shockwave_Attack.smd" {
	fps 30
}

$animation "Throw" "Hulk_Avenger_anims\Throw.smd" {
	fps 30
}

$animation "Jump start" "Hulk_Avenger_anims\Jump start.smd" {
	fps 30
}

$animation "Jump end" "Hulk_Avenger_anims\Jump end.smd" {
	fps 30
}

$animation "another_combo" "Hulk_Avenger_anims\another_combo.smd" {
	fps 45
}

$animation "Double_Punch" "Hulk_Avenger_anims\Double_Punch.smd" {
	fps 50
}

$animation "Mega_combo" "Hulk_Avenger_anims\Mega_combo.smd" {
	fps 150
}

$animation "Clap" "Hulk_Avenger_anims\Clap.smd" {
	fps 30
}

$animation "Puny_God" "Hulk_Avenger_anims\Puny_God.smd" {
	fps 30
}

$animation "Stomp" "Hulk_Avenger_anims\Stomp.smd" {
	fps 30
}

$animation "Hulk_head_punch" "Hulk_Avenger_anims\Hulk_head_punch.smd" {
	fps 30
}

$animation "Big_Punch_combo" "Hulk_Avenger_anims\Big_Punch_combo.smd" {
	fps 45
}

$animation "Knockback" "Hulk_Avenger_anims\Knockback.smd" {
	fps 30
}

$animation "stun2" "Hulk_Avenger_anims\stun2.smd" {
	fps 30
}

$animation "TheWorldBreaker" "Hulk_Avenger_anims\TheWorldBreaker.smd" {
	fps 30
}

$animation "AnotherStun" "Hulk_Avenger_anims\AnotherStun.smd" {
	fps 30
}

$animation "Hulk_Poses" "Hulk_Avenger_anims\Hulk_Poses.smd" {
	fps 30
}

$animation "Hulk_Brutal_Combo" "Hulk_Avenger_anims\Hulk_Brutal_Combo.smd" {
	fps 50
}

$animation "Hulk_mid_jumps" "Hulk_Avenger_anims\Hulk_mid_jumps.smd" {
	fps 30
	loop
	walkframe 29 LX LY
}

$animation "Hulk_long_jumps" "Hulk_Avenger_anims\Hulk_long_jumps.smd" {
	fps 30
	loop
	walkframe 29 LX LY
}

$animation "Hulk_Run_jumps" "Hulk_Avenger_anims\Hulk_Run_jumps.smd" {
	fps 60
	loop
	walkframe 29 LX LY
}

$animation "Hulk_LastHit_Ora" "Hulk_Avenger_anims\Hulk_LastHit_Ora.smd" {
	fps 20
}

$animation "Hulk_Landing" "Hulk_Avenger_anims\Hulk_Landing.smd" {
	fps 30
	walkframe 20 LZ
}

$animation "Hulk_Flying" "Hulk_Avenger_anims\Hulk_Flying.smd" {
	fps 30
	loop
}

$sequence "Hulk Landing" {
	"Hulk_Landing"
	activity "ACT_LAND" 1
	{ event 1100 7 "Hulky Leap" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Flying" {
	"Hulk_Flying"
	activity "ACT_FLYING" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Big Punch Combo" {
	"Big_Punch_combo"
	activity "ACT_BIGPUNCH_COMBO" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 3 "Before Attack" }
	{ event 1100 15 "Brutal Strike" }
	{ event 1100 31 "Before Attack" }
	{ event 1100 44 "Brutal Strike" }
	{ event 1100 50 "TrackingOff" }
	{ event 1100 56 "Before Attack" }
	{ event 1100 69 "Brutal Strike" }
	{ event 1100 90 "Before Smash" }
	{ event 1100 97 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Shockwave attack" {
	"Hulk_Shockwave_Attack"
	activity "ACT_SHOCKWAVE" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 6 "Shockwave_Attack" }
	{ event 1100 18 "Shockwave_Attack" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Middle Jumps" {
	"Hulk_mid_jumps"
	activity "ACT_MIDJUMP" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 29 "Hulky Leap" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Long Jumps" {
	"Hulk_long_jumps"
	activity "ACT_LONGJUMP" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 29 "Hulky Leap" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Head Punch" {
	"Hulk_head_punch"
	activity "ACT_HEADPUNCH" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 12 "HeadPunch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Foot Stomp" {
	"Stomp"
	activity "ACT_FOOTSTOMP" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 10 "Before Attack" }
	{ event 1100 23 "FootStomp" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Puny God" {
	"Puny_God"
	activity "ACT_FATALITY" 1
	{ event 1100 0 "TrackingOff" }
	{ event 1100 7 "Grab Start" }
	{ event 1100 18 "Punch2" }
	{ event 1100 30 "Punch2" }
	{ event 1100 56 "Smash Ground" }
	{ event 1100 55 "Grab Finish" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Clap" {
	"Clap"
	activity "ACT_CLAP" 1
	{ event 1100 26 "Clap" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Stun1" {
	"Knockback"
	activity "ACT_STUN1" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "The World Breaker" {
	"TheWorldBreaker"
	activity "ACT_STUN1" 1
	{ event 1100 0 "TrackingOff" }
	{ event 1100 38 "Before Smash" }
	{ event 1100 54 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Big Stun" {
	"AnotherStun"
	activity "ACT_STUN3" 1
	{ event 1100 0 "TrackingOff" }
	{ event 1100 21 "Stunned" }
	{ event 1100 35 "Stunned" }
	{ event 1100 97 "Roar" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Poses" {
	"Hulk_Poses"
	activity "ACT_POSES" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Long stun" {
	"stun2"
	activity "ACT_STUN2" 1
	{ event 1100 0 "TrackingOff" }
	{ event 1100 16 "Step" }
	{ event 1100 21 "Step" }
	{ event 1100 50 "Step" }
	{ event 1100 55 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Combo 1" {
	"another_combo"
	activity "ACT_COMBO1" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 1 "Before Attack" }
	{ event 1100 5 "Punch" }
	{ event 1100 6 "Before Attack" }
	{ event 1100 12 "Punch" }
	{ event 1100 20 "TrackingOff" }
	{ event 1100 13 "Before Attack" }
	{ event 1100 21 "Punch" }
	{ event 1100 26 "Before Smash" }
	{ event 1100 33 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Throwing" {
	"Throw"
	activity "ACT_THROWING" 1
	{ event 1100 0 "TrackingOff" }
	{ event 1100 10 "Before Throw" }
	{ event 1100 20 "Throwing Sound" }
	{ event 1100 26 "Throwing_Act" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Brutal Strike" {
	"Hulk_brutal_strike"
	activity "ACT_BRUTALSTRIKE" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 7 "Before Attack" }
	{ event 1100 20 "Brutal Strike" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Close Jump" {
	"Hulk close jump"
	activity "ACT_CLOSEJUMP" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Big punch" {
	"Hulk_Heavy_bigpunch"
	activity "ACT_HEAVY_ATTACK" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Under Assault" {
	"Hulk_Under_assault"
	activity "ACT_UNDER_ATTACK" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Calls" {
	"Hulk_calls"
	activity "ACT_CALLS" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "idle" {
	"Hulk_Avenger_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle1" {
	"Hulk_Avenger_anims\Idle1.smd"
	activity "ACT_IDLE2" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle2" {
	"Hulk_Avenger_anims\Idle2.smd"
	activity "ACT_IDLE1" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle3" {
	"Hulk_Avenger_anims\Idle3.smd"
	activity "ACT_IDLE_RELAXED" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Scream" {
	"Hulk_Avenger_anims\Scream.smd"
	activity "ACT_ANGRY" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "Run" {
	"Run1"
	activity "ACT_RUN" 1
	{ event 1100 2 "Step" }
	{ event 1100 12 "Step" }
	{ event 1100 2 "ScreenShakeOnStep" }
	{ event 1100 12 "ScreenShakeOnStep" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Run Hover" {
	"Hulk_Run_jumps"
	activity "ACT_RUN_AIM" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 29 "Hulky Leap" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Walk" {
	"Walk1"
	activity "ACT_WALK" 1
	{ event AE_CL_PLAYSOUND 26 "Hulk_LStep" }
	{ event AE_CL_PLAYSOUND 47 "Hulk_RStep" }
	{ event 1100 26 "ScreenShakeOnStep" }
	{ event 1100 47 "ScreenShakeOnStep" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hit1" {
	"Hulk_Avenger_anims\Hit1.smd"
	activity "ACT_HIT1" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "Attack1" {
	"attack_1"
	activity "ACT_ATTACK0" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 2 "Before Attack" }
	{ event 1100 5 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack2" {
	"attack_2"
	activity "ACT_ATTACK1" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 2 "Before Attack" }
	{ event 1100 5 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack3" {
	"attack_3"
	activity "ACT_ATTACK3" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 2 "Before Attack" }
	{ event 1100 5 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack4" {
	"attack_4"
	activity "ACT_ATTACK4" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 5 "Before Attack" }
	{ event 1100 14 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack5" {
	"attack_5"
	activity "ACT_ATTACK5" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 3 "Before Attack" }
	{ event 1100 7 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack6" {
	"attack_6"
	activity "ACT_ATTACK6" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 3 "Before Attack" }
	{ event 1100 7 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack7" {
	"attack_7"
	activity "ACT_ATTACK7" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 1 "Before Smash" }
	{ event 1100 7 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack8" {
	"attack_8"
	activity "ACT_ATTACK8" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 1 "Before Attack" }
	{ event 1100 5 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Smash Ground" {
	"attack_9"
	activity "ACT_ATTACK9" -1
	{ event 1100 0 "TrackingOff" }
	{ event 1100 5 "Before Smash" }
	{ event 1100 12 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Brutal Strike Combo" {
	"Hulk_Brutal_Combo"
	activity "ACT_ATTACK22" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 4 "Before Attack" }
	{ event 1100 10 "Brutal Strike" }
	{ event 1100 23 "Before Attack" }
	{ event 1100 29 "Brutal Strike" }
	{ event 1100 43 "Before Attack" }
	{ event 1100 35 "TrackingOff" }
	{ event 1100 49 "Brutal Strike" }
	{ event 1100 63 "Before Attack" }
	{ event 1100 69 "Brutal Strike" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Double Punch" {
	"Double_Punch"
	activity "ACT_ATTACK23" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 2 "Before Attack" }
	{ event 1100 6 "Punch" }
	{ event 1100 18 "Before Attack" }
	{ event 1100 23 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Smash Ground RAGE" {
	"attack_9"
	activity "ACT_ATTACK10" -1
	{ event 1100 0 "TrackingOff" }
	{ event 1100 5 "Before Smash" }
	{ event 1100 12 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack1 RAGE" {
	"attack_1"
	activity "ACT_ATTACK11" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 2 "Before Attack" }
	{ event 1100 5 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack2 RAGE" {
	"attack_2"
	activity "ACT_ATTACK12" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 2 "Before Attack" }
	{ event 1100 5 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack3 RAGE" {
	"attack_3"
	activity "ACT_ATTACK13" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 2 "Before Attack" }
	{ event 1100 5 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack4 RAGE" {
	"attack_4"
	activity "ACT_ATTACK14" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 5 "Before Attack" }
	{ event 1100 14 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack5 RAGE" {
	"attack_5"
	activity "ACT_ATTACK15" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 3 "Before Attack" }
	{ event 1100 7 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack6 RAGE" {
	"attack_6"
	activity "ACT_ATTACK16" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 3 "Before Attack" }
	{ event 1100 7 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack7 RAGE" {
	"attack_7"
	activity "ACT_ATTACK17" -1
	{ event 1100 0 "TrackingOff" }
	{ event 1100 1 "Before Smash" }
	{ event 1100 7 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Attack8 RAGE" {
	"attack_8"
	activity "ACT_ATTACK18" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 1 "Before Attack" }
	{ event 1100 5 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Brutal Strike RAGE" {
	"Hulk_brutal_strike"
	activity "ACT_ATTACK19" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 7 "Before Attack" }
	{ event 1100 20 "Brutal Strike" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Hulk Combo RAGE" {
	"another_combo"
	activity "ACT_ATTACK20" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 1 "Before Attack" }
	{ event 1100 5 "Punch" }
	{ event 1100 6 "Before Attack" }
	{ event 1100 12 "Punch" }
	{ event 1100 20 "TrackingOff" }
	{ event 1100 13 "Before Attack" }
	{ event 1100 21 "Punch" }
	{ event 1100 26 "Before Smash" }
	{ event 1100 33 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Big Punch Combo RAGE" {
	"Big_Punch_combo"
	activity "ACT_ATTACK21" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 3 "Before Attack" }
	{ event 1100 15 "Brutal Strike" }
	{ event 1100 31 "Before Attack" }
	{ event 1100 44 "Brutal Strike" }
	{ event 1100 50 "TrackingOff" }
	{ event 1100 56 "Before Attack" }
	{ event 1100 69 "Brutal Strike" }
	{ event 1100 90 "Before Smash" }
	{ event 1100 97 "Smash Ground" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Brutal Strike Combo RAGE" {
	"Hulk_Brutal_Combo"
	activity "ACT_ATTACK24" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 4 "Before Attack" }
	{ event 1100 10 "Brutal Strike" }
	{ event 1100 23 "Before Attack" }
	{ event 1100 29 "Brutal Strike" }
	{ event 1100 35 "TrackingOff" }
	{ event 1100 43 "Before Attack" }
	{ event 1100 49 "Brutal Strike" }
	{ event 1100 63 "Before Attack" }
	{ event 1100 69 "Brutal Strike" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Double Punch RAGE" {
	"Double_Punch"
	activity "ACT_ATTACK25" -1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 2 "Before Attack" }
	{ event 1100 6 "Punch" }
	{ event 1100 18 "Before Attack" }
	{ event 1100 23 "Punch" }
	fadein 0.2
	fadeout 0.2
}

$sequence "JoJo Ref" {
	"Mega_combo"
	activity "ACT_ATTACK30" 1
	{ event 1100 0 "TrackingOn" }
	{ event 1100 6 "FastP" }
	{ event 1100 23 "FastP" }
	{ event 1100 38 "FastP" }
	{ event 1100 56 "FastP" }
	{ event 1100 72 "FastP" }
	{ event 1100 73 "TrackingOff" }
	{ event 1100 90 "FastP" }
	{ event 1100 104 "FastP" }
	{ event 1100 122 "FastP" }
	{ event 1100 136 "FastP" }
	{ event 1100 153 "FastP" }
	{ event 1100 168 "FastP" }
	{ event 1100 186 "FastP" }
	{ event 1100 202 "FastP" }
	{ event 1100 220 "FastP" }
	{ event 1100 233 "FastP" }
	{ event 1100 252 "FastP" }
	{ event 1100 266 "FastP" }
	{ event 1100 283 "FastP" }
	{ event 1100 297 "FastP" }
	{ event 1100 315 "FastP" }
	{ event 1100 321 "LastP" }
	fadein 0.2
	fadeout 0.2
}

$sequence "JoJo Ref Last Punch" {
	"Hulk_LastHit_Ora"
	activity "ACT_ATTACK32" 1
	{ event 1100 14 "LastP" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Nope" {
	"hulk no"
	activity "ACT_DISAGREE" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Agree" {
	"hulk agree"
	activity "ACT_AGREE" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Wait" {
	"Wait a minute"
	activity "ACT_WHAT" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Rampage" {
	"Hulk Rampage"
	activity "ACT_RAMPAGE" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Salute" {
	"Hulk Salute"
	activity "ACT_SALUTE" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Spawn" {
	"Hulk Spawn"
	activity "ACT_SPAWN" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Victory" {
	"Hulk wins"
	activity "ACT_VICTORY" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Victory2" {
	"Hulk wins2"
	activity "ACT_VICTORY2" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Victory3" {
	"Hulk wins3"
	activity "ACT_VICTORY3" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Unknown Damage1" {
	"Unknown_damage1"
	activity "ACT_UNKNOWN_DAMAGE1" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "Unknown Damage2" {
	"Unknown_damage2"
	activity "ACT_UNKNOWN_DAMAGE2" 1
	fadein 0.2
	fadeout 0.2
}

$sequence "JUMP NEW START" {
	"Hulk_Avenger_anims\JUMP NEW START.smd"
	activity "ACT_JUMPSTART" -1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "JUMP NEW END" {
	"Hulk_Avenger_anims\JUMP NEW END.smd"
	activity "ACT_JUMPEND" -1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "JUMP NEW LOOP" {
	"Hulk_Avenger_anims\JUMP NEW LOOP.smd"
	activity "ACT_JUMP" -1
	fadein 0.2
	fadeout 0.2
	fps 15
	loop
}

$sequence "ragdoll" {
	"Hulk_Avenger_anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionjoints "Hulk_Avenger_physics.smd"
{
	$mass 250
	$inertia 4
	$damping 0.05
	$rotdamping 5
	$rootbone "root"


	$jointconstrain "g_spine01" x limit 0 0 0
	$jointconstrain "g_spine01" y limit 0 0 0
	$jointconstrain "g_spine01" z limit 0 0 0

	$jointmassbias "g_spine02" 5
	$jointconstrain "g_spine02" x limit -21 12 0
	$jointconstrain "g_spine02" y limit -15 15 0
	$jointconstrain "g_spine02" z limit -21 17 0

	$jointmassbias "g_spine03" 5
	$jointconstrain "g_spine03" x limit -37 17 0
	$jointconstrain "g_spine03" y limit -21 30 0
	$jointconstrain "g_spine03" z limit -23 35 0

	$jointmassbias "g_r_clavical" 5
	$jointconstrain "g_r_clavical" x limit 0 0 0
	$jointconstrain "g_r_clavical" y limit 0 0 0
	$jointconstrain "g_r_clavical" z limit 0 0 0

	$jointmassbias "g_r_shoulder" 5
	$jointconstrain "g_r_shoulder" x limit 0 0 0
	$jointconstrain "g_r_shoulder" y limit -35 23 0
	$jointconstrain "g_r_shoulder" z limit -21 17 0

	$jointmassbias "g_neck" 5
	$jointconstrain "g_neck" x limit -15 12 0
	$jointconstrain "g_neck" y limit -21 21 0
	$jointconstrain "g_neck" z limit -28 8 0

	$jointmassbias "g_head" 5
	$jointconstrain "g_head" x limit -7 21 0
	$jointconstrain "g_head" y limit -30 6 0
	$jointconstrain "g_head" z limit -32 29 0

	$jointmassbias "g_jaw" 1.4
	$jointconstrain "g_jaw" x limit -19 37 0
	$jointconstrain "g_jaw" y limit 0 0 0
	$jointconstrain "g_jaw" z limit 0 0 0

	$jointconstrain "g_l_clavical" x limit 0 0 0
	$jointconstrain "g_l_clavical" y limit 0 0 0
	$jointconstrain "g_l_clavical" z limit 0 0 0

	$jointconstrain "g_l_shoulder" x limit -117 10 0
	$jointconstrain "g_l_shoulder" y limit 0 0 0
	$jointconstrain "g_l_shoulder" z limit 0 0 0

	$jointconstrain "g_l_elbow" x limit -50 0 0
	$jointconstrain "g_l_elbow" y limit 0 32 0
	$jointconstrain "g_l_elbow" z limit 0 44 0

	$jointconstrain "g_l_wrist" x limit -10 32 0
	$jointconstrain "g_l_wrist" y limit 0 37 0
	$jointconstrain "g_l_wrist" z limit 0 37 0

	$jointmassbias "g_l_biceptwist" 5
	$jointconstrain "g_l_biceptwist" x limit -32 8 0
	$jointconstrain "g_l_biceptwist" y limit 0 8 0
	$jointconstrain "g_l_biceptwist" z limit -23 3 0

	$jointmassbias "g_l_forarm" 5
	$jointconstrain "g_l_forarm" x limit -39 0 0
	$jointconstrain "g_l_forarm" y limit 0 0 0
	$jointconstrain "g_l_forarm" z limit 0 0 0

	$jointmassbias "g_r_elbow" 5
	$jointconstrain "g_r_elbow" x limit 0 0 0
	$jointconstrain "g_r_elbow" y limit -39 -6 0
	$jointconstrain "g_r_elbow" z limit 0 0 0

	$jointmassbias "g_r_biceptwist" 5
	$jointconstrain "g_r_biceptwist" x limit -37 6 0
	$jointconstrain "g_r_biceptwist" y limit -6 3 0
	$jointconstrain "g_r_biceptwist" z limit -26 -1 0

	$jointmassbias "g_r_wrist" 5
	$jointconstrain "g_r_wrist" x limit 0 0 0
	$jointconstrain "g_r_wrist" y limit -23 32 0
	$jointconstrain "g_r_wrist" z limit 0 0 0

	$jointmassbias "g_r_forarm" 5
	$jointconstrain "g_r_forarm" x limit 0 0 0
	$jointconstrain "g_r_forarm" y limit 0 0 0
	$jointconstrain "g_r_forarm" z limit 0 0 0


	$jointmassbias "g_l_knee" 5
	$jointconstrain "g_l_knee" x limit -59 57 0
	$jointconstrain "g_l_knee" y limit -61 -21 0
	$jointconstrain "g_l_knee" z limit -6 12 0

	$jointmassbias "g_l_ankle" 5
	$jointdamping "g_l_ankle" 0.02
	$jointconstrain "g_l_ankle" x limit -28 26 0
	$jointconstrain "g_l_ankle" y limit 0 0 0
	$jointconstrain "g_l_ankle" z limit 0 0 0

	$jointmassbias "g_l_ball" 5
	$jointconstrain "g_l_ball" x limit 0 0 0
	$jointconstrain "g_l_ball" y limit 0 0 0
	$jointconstrain "g_l_ball" z limit 0 0 0

	$jointmassbias "g_l_thightwist" 5
	$jointconstrain "g_l_thightwist" x limit -35 28 0
	$jointconstrain "g_l_thightwist" y limit -64 21 0
	$jointconstrain "g_l_thightwist" z limit -50 15 0


	$jointmassbias "g_r_knee" 5
	$jointconstrain "g_r_knee" x limit 0 0 0
	$jointconstrain "g_r_knee" y limit -28 23 0
	$jointconstrain "g_r_knee" z limit -32 23 0

	$jointmassbias "g_r_ankle" 5
	$jointconstrain "g_r_ankle" x limit -16 15 0
	$jointconstrain "g_r_ankle" y limit -61 44 0
	$jointconstrain "g_r_ankle" z limit -68 46 1000

	$jointmassbias "g_r_ball" 5
	$jointconstrain "g_r_ball" x limit 0 0 0
	$jointconstrain "g_r_ball" y limit 0 0 0
	$jointconstrain "g_r_ball" z limit 0 0 0

	$jointmassbias "g_r_thightwist" 5
	$jointconstrain "g_r_thightwist" x limit -23 -1 1000
	$jointconstrain "g_r_thightwist" y limit 0 0 0
	$jointconstrain "g_r_thightwist" z limit -26 -10 0
}
