/*
   Copyright (c) 2016 Adam Dodd
   
   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:
   
   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.
   
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
*/

item(empty).
% A placeholder for 'nothing'

% Consumables
item(clarity).
item(faerieFire).
item(enchantedMango).
item(tango).
item(healingSalve).
item(smokeOfDeceit).
item(townPortalScroll).
item(dustOfAppearance).
item(animalCourier).
item(flyingCourier).
item(observerWard).
item(sentryWard).
item(tomeOfKnowledge).
item(bottle).

% Attributes
item(ironBranch).
item(gauntletsOfStrength).
item(slippersOfAgility).
item(mantleOfIntelligence).
item(circlet).
item(beltOfStrength).
item(bandOfElvenskin).
item(robeOfTheMagi).
item(ogreClub).
item(bladeOfAlacrity).
item(staffOfWizardry).

% Armaments
item(ringOfProtection).
item(stoutShield).
item(quellingBlade).
item(infusedRaindrop).
item(blightStone).
item(orbOfVenom).
item(bladesOfAttack).
item(chainmail).
item(quarterstaff).
item(helmOfIronWill).
item(broadsword).
item(claymore).
item(javelin).
item(mithrilHammer).

% Arcane
item(windLace).
item(magicStick).
item(sagesMask).
item(ringOfRegen).
item(bootsOfSpeed).
item(glovesOfHaste).
item(cloak).
item(ringOfHealth).
item(voidStone).
item(gemOfTrueSight).
item(morbidMask).
item(shadowAmulet).
item(ghostScepter).
item(blinkDagger).

% Secret shop
item(energyBooster).
item(vitalityBooster).
item(pointBooster).
item(platemail).
item(talismanOfEvasion).
item(hyperstone).
item(ultimateOrb).
item(demonEdge).
item(mysticStaff).
item(reaver).
item(eaglesong).
item(sacredRelic).

% The recipes themselves are also items
item(recipe(X)) :-
   recipe(X), !.

% As are the builds
item(X) :-
   build(X, _).

% Recipe upgrades

recipe(X) :-
   build_contains_recipe(X).

build_contains_recipe(X) :-
   build(X, Items), build_contains_recipe2(X, Items).

build_contains_recipe2(X, [recipe(X)| _T]).
build_contains_recipe2(X, [_H| T]) :-
   build_contains_recipe2(X, T), !.

build(wards, [observerWard, sentryWard]).

% Common
build(magicWand, [magicStick, ironBranch, ironBranch, circlet]).
build(nullTalisman, [circlet, mantleOfIntelligence, recipe(nullTalisman)]).
build(wraithBand, [circlet, slippersOfAgility, recipe(wraithBand)]).
build(poorMansShield, [slippersOfAgility, slippersOfAgility, stoutShield]).
build(bracer, [circlet, gauntletsOfStrength, recipe(bracer)]).
build(soulRing, [ringOfRegen, sagesMask, recipe(soulRing)]).
build(phaseBoots, [bootsOfSpeed, bladesOfAttack, bladesOfAttack]).
build(powerTreads, [glovesOfHaste, bootsOfSpeed, beltOfStrength]).
build(powerTreads, [glovesOfHaste, bootsOfSpeed, bandOfElvenskin]).
build(powerTreads, [glovesOfHaste, bootsOfSpeed, robeOfTheMagi]).
build(oblivionStaff, [quarterstaff, sagesMask, robeOfTheMagi]).
build(perseverance, [ringOfHealth, voidStone]).
build(handOfMidas, [glovesOfHaste, recipe(handOfMidas)]).
build(bootsOfTravel, [bootsOfSpeed, recipe(bootsOfTravel)]).
build(moonShard, [hyperstone, hyperstone]).

% Support
build(ringOfBasilius, [sagesMask, ringOfProtection]).
build(ironTalon, [quellingBlade, ringOfProtection, recipe(ironTalon)]).
build(headdress, [ringOfRegen, ironBranch, recipe(headdress)]).
build(buckler, [chainmail, ironBranch, recipe(buckler)]).
build(urnOfShadows, [gauntletsOfStrength, gauntletsOfStrength, sagesMask,
      recipe(urnOfShadows)]).
build(tranquilBoots, [bootsOfSpeed, ringOfProtection, ringOfRegen]).
build(ringOfAquila, [wraithBand, ringOfBasilius]).
build(medallionOfCourage, [chainmail, sagesMask, blightStone]).
build(arcaneBoots, [bootsOfSpeed, energyBooster]).
build(drumOfEndurance, [sagesMask, bracer, windLace, recipe(drumOfEndurance)]).
build(mekansm, [headdress, buckler, recipe(mekansm)]).
build(vladimirsOffering, [headdress, ringOfBasilius, morbidMask]).
build(pipeOfInsight, [hoodOfDefiance, headdress, recipe(pipeOfInsight)]).
build(guardianGreaves, [arcaneBoots, mekansm, recipe(guardianGreaves)]).

% Caster
build(glimmerCape, [shadowAmulet, cloak]).
build(forceStaff, [staffOfWizardry, ringOfRegen, recipe(forceStaff)]).
build(veilOfDiscord, [helmOfIronWill, nullTalisman, nullTalisman,
      recipe(veilOfDiscord)]).
build(aetherLens, [energyBooster, ringOfHealth, recipe(aetherLens)]).
build(necronomicon1, [staffOfWizardry, beltOfStrength, recipe(necronomicon1)]).
build(necronomicon2, [necronomicon1, recipe(necronomicon2)]).
build(necronomicon3, [necronomicon2, recipe(necronomicon3)]).
build(dagon1, [staffOfWizardry, nullTalisman, recipe(dagon1)]).
build(dagon2, [dagon1, recipe(dagon2)]).
build(dagon3, [dagon2, recipe(dagon3)]).
build(dagon4, [dagon3, recipe(dagon4)]).
build(dagon5, [dagon4, recipe(dagon5)]).
build(eulsScepterOfDivinity, [staffOfWizardry, voidStone, windLace,
      recipe(eulsScepterOfDivinity)]).
build(solarCrest, [medallionOfCourage, talismanOfEvasion]).
build(rodOfAtos, [staffOfWizardry, staffOfWizardry, vitalityBooster]).
build(orchidMalevolence, [oblivionStaff, oblivionStaff,
      recipe(orchidMalevolence)]).
build(aghanimsScepter, [pointBooster, staffOfWizardry, ogreClub,
      bladeOfAlacrity]).
build(refresherOrb, [perseverance, perseverance, recipe(refresherOrb)]).
build(scytheOfVyse, [mysticStaff, ultimateOrb, voidStone]).
build(octarineCore, [mysticStaff, soulBooster]).

% Armor
build(hoodOfDefiance, [ringOfHealth, cloak, ringOfRegen]).
build(vanguard, [ringOfHealth, vitalityBooster, stoutShield]).
build(bladeMail, [broadsword, chainmail, robeOfTheMagi]).
build(soulBooster, [vitalityBooster, energyBooster, pointBooster]).
build(crimsonGuard, [vanguard, buckler, recipe(crimsonGuard)]).
build(blackKingBar, [ogreClub, mithrilHammer, recipe(blackKingBar)]).
build(lotusOrb, [perseverance, platemail, energyBooster]).
build(shivasGuard, [platemail, mysticStaff, recipe(shivasGuard)]).
build(bloodstone, [soulRing, soulBooster, recipe(bloodstone)]).
build(mantaStyle, [yasha, ultimateOrb, recipe(mantaStyle)]).
build(linkensSphere, [perseverance, ultimateOrb, recipe(linkensSphere)]).
build(hurricanePike, [forceStaff, dragonLance, recipe(hurricanePike)]).
build(assaultCuirass, [platemail, hyperstone, chainmail,
      recipe(assaultCuirass)]).
build(heartOfTarrasque, [reaver, vitalityBooster, recipe(heartOfTarrasque)]).

% Weapons
build(crystalys, [broadsword, bladesOfAttack, recipe(crystalys)]).
build(armletOfMordiggian, [helmOfIronWill, glovesOfHaste, bladesOfAttack,
      recipe(armletOfMordiggian)]).
build(shadowBlade, [shadowAmulet, claymore]).
build(skullBasher, [beltOfStrength, javelin, recipe(skullBasher)]).
build(battleFury, [perseverance, claymore, broadsword, quellingBlade]).
build(etherealBlade, [eaglesong, ghostScepter]).
build(silverEdge, [shadowBlade, ultimateOrb, recipe(silverEdge)]).
build(radiance, [sacredRelic, recipe(radiance)]).
build(monkeyKingBar, [demonEdge, javelin, javelin]).
build(daedalus, [crystalys, demonEdge, recipe(daedalus)]).
build(butterfly, [talismanOfEvasion, quarterstaff, eaglesong]).
build(divineRapier, [sacredRelic, demonEdge]).
build(abyssalBlade, [skullBasher, vanguard, recipe(abyssalBlade)]).
build(bloodthorn, [orchidMalevolence, crystalys, recipe(bloodthorn)]).

% Artifacts
build(maskOfMadness, [morbidMask, recipe(maskOfMadness)]).
build(helmOfTheDominator, [glovesOfHaste, headdress,
      recipe(helmOfTheDominator)]).
build(dragonLance, [ogreClub, bandOfElvenskin, bandOfElvenskin]).
build(sange, [ogreClub, beltOfStrength, recipe(sange)]).
build(yasha, [bladeOfAlacrity, bandOfElvenskin, recipe(yasha)]).
build(echoSabre, [ogreClub, oblivionStaff]).
build(maelstrom, [glovesOfHaste, mithrilHammer, recipe(maelstrom)]).
build(diffusalBlade, [bladeOfAlacrity, bladeOfAlacrity, robeOfTheMagi,
      recipe(diffusalBlade)]).
build(desolator, [mithrilHammer, mithrilHammer, blightStone]).
build(heavensHalberd, [sange, talismanOfEvasion]).
build(sangeAndYasha, [sange, yasha]).
build(eyeOfSkadi, [ultimateOrb, ultimateOrb, pointBooster, orbOfVenom]).
build(mjollnir, [hyperstone, maelstrom, recipe(mjollnir)]).
build(satanic, [morbidMask, mithrilHammer, reaver]).
