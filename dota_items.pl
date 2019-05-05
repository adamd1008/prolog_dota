/*
   Copyright (c) 2019 Adam Dodd
   
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
item(townPortalScroll).
item(clarity).
item(faerieFire).
item(smokeOfDeceit).
item(observerWard).
item(sentryWard).
item(enchantedMango).
item(healingSalve).
item(tango).
item(tomeOfKnowledge).
item(dustOfAppearance).
item(animalCourier).
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
item(crown).
item(ogreAxe).
item(bladeOfAlacrity).
item(staffOfWizardry).

% Armaments
item(ringOfProtection).
item(stoutShield).
item(quellingBlade).
item(infusedRaindrop).
item(orbOfVenom).
item(blightStone).
item(bladesOfAttack).
item(chainmail).
item(quarterstaff).
item(helmOfIronWill).
item(javelin).
item(broadsword).
item(claymore).
item(mithrilHammer).

% Arcane
item(magicStick).
item(windLace).
item(ringOfRegen).
item(sagesMask).
item(bootsOfSpeed).
item(glovesOfHaste).
item(cloak).
item(ringOfTarrasque).
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
build(magicWand, [magicStick, ironBranch, ironBranch, recipe(magicWand)]).
build(nullTalisman, [circlet, mantleOfIntelligence, recipe(nullTalisman)]).
build(wraithBand, [circlet, slippersOfAgility, recipe(wraithBand)]).
build(bracer, [circlet, gauntletsOfStrength, recipe(bracer)]).
build(soulRing, [ringOfRegen, gauntletsOfStrength, gauntletsOfStrength,
      recipe(soulRing)]).
build(powerTreads, [glovesOfHaste, bootsOfSpeed, beltOfStrength]).
build(powerTreads, [glovesOfHaste, bootsOfSpeed, bandOfElvenskin]).
build(powerTreads, [glovesOfHaste, bootsOfSpeed, robeOfTheMagi]).
build(phaseBoots, [bootsOfSpeed, chainmail, bladesOfAttack]).
build(oblivionStaff, [quarterstaff, sagesMask, robeOfTheMagi]).
build(perseverance, [ringOfHealth, voidStone]).
build(maskOfMadness, [morbidMask, quarterstaff]).
build(helmOfTheDominator, [glovesOfHaste, headdress, ringOfHealth]).
build(handOfMidas, [glovesOfHaste, recipe(handOfMidas)]).
build(bootsOfTravel, [bootsOfSpeed, recipe(bootsOfTravel)]).
build(moonShard, [hyperstone, hyperstone]).

% Support
build(ringOfBasilius, [sagesMask, ringOfProtection]).
build(headdress, [ringOfRegen, ironBranch, recipe(headdress)]).
build(buckler, [chainmail, ironBranch, recipe(buckler)]).
build(urnOfShadows, [infusedRaindrop, circlet, ringOfProtection,
      recipe(urnOfShadows)]).
build(tranquilBoots, [bootsOfSpeed, windLace, ringOfRegen]).
build(medallionOfCourage, [chainmail, sagesMask, blightStone]).
build(arcaneBoots, [bootsOfSpeed, energyBooster]).
build(drumOfEndurance, [sagesMask, crown, windLace, recipe(drumOfEndurance)]).
build(vladimirsOffering, [ringOfBasilius, morbidMask,
      recipe(vladimirsOffering)]).
build(mekansm, [headdress, buckler, recipe(mekansm)]).
build(holyLocket, [ringOfTarrasque, voidStone, cloak, recipe(holyLocket)]).
build(spiritVessel, [urnOfShadows, vitalityBooster, windLace,
      recipe(spiritVessel)]).
build(pipeOfInsight, [hoodOfDefiance, headdress, recipe(pipeOfInsight)]).
build(guardianGreaves, [mekansm, arcaneBoots, recipe(guardianGreaves)]).

% Caster
build(glimmerCape, [shadowAmulet, cloak]).
build(veilOfDiscord, [helmOfIronWill, crown, recipe(veilOfDiscord)]).
build(forceStaff, [staffOfWizardry, ringOfHealth, recipe(forceStaff)]).
build(aetherLens, [energyBooster, voidStone, recipe(aetherLens)]).
build(necronomicon1, [sagesMask, sagesMask, beltOfStrength,
      recipe(necronomicon1)]).
build(necronomicon2, [necronomicon1, recipe(necronomicon2)]).
build(necronomicon3, [necronomicon2, recipe(necronomicon3)]).
build(dagon1, [staffOfWizardry, crown, recipe(dagon1)]).
build(dagon2, [dagon1, recipe(dagon2)]).
build(dagon3, [dagon2, recipe(dagon3)]).
build(dagon4, [dagon3, recipe(dagon4)]).
build(dagon5, [dagon4, recipe(dagon5)]).
build(eulsScepterOfDivinity, [staffOfWizardry, voidStone, windLace,
      recipe(eulsScepterOfDivinity)]).
build(rodOfAtos, [staffOfWizardry, crown, crown, recipe(rodOfAtos)]).
build(solarCrest, [medallionOfCourage, ultimateOrb, windLace,
      recipe(solarCrest)]).
build(orchidMalevolence, [oblivionStaff, oblivionStaff,
      recipe(orchidMalevolence)]).
build(aghanimsScepter, [pointBooster, staffOfWizardry, ogreAxe,
      bladeOfAlacrity]).
build(nullifier, [sacredRelic, helmOfIronWill]).
build(refresherOrb, [perseverance, perseverance, recipe(refresherOrb)]).
build(scytheOfVyse, [mysticStaff, ultimateOrb, voidStone]).
build(octarineCore, [mysticStaff, soulBooster]).

% Armor
build(hoodOfDefiance, [ringOfHealth, cloak, ringOfRegen]).
build(vanguard, [ringOfHealth, vitalityBooster, stoutShield]).
build(bladeMail, [broadsword, chainmail, robeOfTheMagi]).
build(soulBooster, [vitalityBooster, energyBooster, pointBooster]).
build(aeonDisk, [vitalityBooster, energyBooster, recipe(aeonDisk)]).
build(crimsonGuard, [vanguard, buckler, recipe(crimsonGuard)]).
build(lotusOrb, [perseverance, platemail, energyBooster]).
build(blackKingBar, [ogreAxe, mithrilHammer, recipe(blackKingBar)]).
build(hurricanePike, [forceStaff, dragonLance, recipe(hurricanePike)]).
build(shivasGuard, [platemail, mysticStaff, recipe(shivasGuard)]).
build(mantaStyle, [yasha, ultimateOrb, recipe(mantaStyle)]).
build(bloodstone, [perseverance, soulBooster]).
build(linkensSphere, [perseverance, ultimateOrb, recipe(linkensSphere)]).
build(heartOfTarrasque, [ringOfTarrasque, vitalityBooster, reaver,
      recipe(heartOfTarrasque)]).
build(assaultCuirass, [platemail, hyperstone, chainmail,
      recipe(assaultCuirass)]).

% Weapons
build(crystalys, [broadsword, bladesOfAttack, recipe(crystalys)]).
build(armletOfMordiggian, [helmOfIronWill, glovesOfHaste, bladesOfAttack,
      recipe(armletOfMordiggian)]).
build(meteorHammer, [ogreAxe, staffOfWizardry, ringOfRegen, sagesMask]).
build(shadowBlade, [shadowAmulet, claymore]).
build(skullBasher, [mithrilHammer, beltOfStrength, recipe(skullBasher)]).
build(monkeyKingBar, [demonEdge, javelin, quarterstaff]).
build(battleFury, [demonEdge, perseverance, quellingBlade, recipe(battleFury)]).
build(etherealBlade, [eaglesong, ghostScepter]).
build(radiance, [sacredRelic, recipe(radiance)]).
build(daedalus, [crystalys, demonEdge, recipe(daedalus)]).
build(butterfly, [talismanOfEvasion, quarterstaff, eaglesong]).
build(silverEdge, [shadowBlade, ultimateOrb, recipe(silverEdge)]).
build(divineRapier, [sacredRelic, demonEdge]).
build(abyssalBlade, [skullBasher, vanguard, recipe(abyssalBlade)]).
build(bloodthorn, [orchidMalevolence, crystalys, recipe(bloodthorn)]).

% Artifacts
build(dragonLance, [ogreAxe, bandOfElvenskin, bandOfElvenskin]).
build(sange, [ogreAxe, beltOfStrength, recipe(sange)]).
build(yasha, [bladeOfAlacrity, bandOfElvenskin, recipe(yasha)]).
build(kaya, [staffOfWizardry, robeOfTheMagi, recipe(kaya)]).
build(echoSabre, [ogreAxe, oblivionStaff]).
build(maelstrom, [mithrilHammer, javelin]).
build(diffusalBlade, [bladeOfAlacrity, bladeOfAlacrity, robeOfTheMagi,
      recipe(diffusalBlade)]).
build(heavensHalberd, [sange, talismanOfEvasion]).
build(desolator, [mithrilHammer, mithrilHammer, blightStone]).
build(kayaAndSange, [sange, kaya]).
build(sangeAndYasha, [yasha, sange]).
build(yashaAndKaya, [kaya, yasha]).
build(satanic, [morbidMask, claymore, reaver]).
build(eyeOfSkadi, [ultimateOrb, ultimateOrb, pointBooster]).
build(mjollnir, [hyperstone, maelstrom, recipe(mjollnir)]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Prices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%price(empty, 0).
%
%% Consumables
%price(townPortalScroll, 50).
%price(clarity, 50).
%price(faerieFire, 70).
%price(smokeOfDeceit, 80).
%price(observerWard, 80).
%price(sentryWard, 100).
%price(enchantedMango, 100).
%price(healingSalve, 110).
%price(tango, 90).
%price(tomeOfKnowledge, 150).
%price(dustOfAppearance, 180).
%price(animalCourier, 50).
%price(bottle, 650).
%
%price(ironBranch, 50).
%price(gauntletsOfStrength, 135).
%price(slippersOfAgility, 135).
%price(mantleOfIntelligence, 135).
%price(circlet, 165).
%price(beltOfStrength, 450).
%price(bandOfElvenskin, 450).
%price(robeOfTheMagi, 450).
%price(ogreAxe, 1000).
%price(bladeOfAlacrity, 1000).
%price(staffOfWizardry, 1000).
%
%price(ringOfProtection, 175).
%price(stoutShield, 200).
%price(quellingBlade, 200).
%price(infusedRaindrop, 225).
%price(orbOfVenom, 275).
%price(blightStone, 300).
%price(bladesOfAttack, 420).
%price(chainmail, 550).
%price(quarterstaff, 875).
%price(helmOfIronWill, 900).
%price(javelin, 1100).
%price(broadsword, 1200).
%price(claymore, 1400).
%price(mithrilHammer, 1600).
%
%price(magicStick, 200).
%price(windLace, 250).
%price(ringOfRegen, 300).
%price(sagesMask, 325).
%price(bootsOfSpeed, 400).
%price(glovesOfHaste, 500).
%price(cloak, 550).
%price(ringOfHealth, 850).
%price(voidStone, 850).
%price(gemOfTrueSight, 900).
%price(morbidMask, 1100).
%price(shadowAmulet, 1300).
%price(ghostScepter, 1500).
%price(blinkDagger, 2250).
%
%price(energyBooster, 900).
%price(vitalityBooster, 1100).
%price(pointBooster, 1200).
%price(platemail, 1400).
%price(talismanOfEvasion, 1450).
%price(hyperstone, 2000).
%price(ultimateOrb, 2150).
%price(demonEdge, 2200).
%price(mysticStaff, 2700).
%price(reaver, 3000).
%price(eaglesong, 3200).
%price(sacredRelic, 3800).
%
%% Recipes
%price(recipe(nullTalisman), 165).
%price(recipe(wraithBand), 165).
%price(recipe(bracer), 165).
%price(recipe(soulRing), 200).
%price(recipe(handOfMidas), 1650).
%price(recipe(bootsOfTravel), 2000).
%price(recipe(headdress), 300).
%price(recipe(buckler), 200).
%price(recipe(urnOfShadows), 310).
%price(recipe(mekansm), 900).
%price(recipe(spiritVessel), 750).
%price(recipe(pipeOfInsight), 800).
%price(recipe(guardianGreaves), 1700).
%price(recipe(veilOfDiscord), 500).
%price(recipe(aetherLens), 600).
%price(recipe(forceStaff), 400).
%price(recipe(necronomicon1), 1300).
%price(recipe(necronomicon2), 1300).
%price(recipe(necronomicon3), 1300).
%price(recipe(dagon1), 1250).
%price(recipe(dagon2), 1250).
%price(recipe(dagon3), 1250).
%price(recipe(dagon4), 1250).
%price(recipe(dagon5), 1250).
%price(recipe(eulsScepterOfDivinity), 650).
%price(recipe(rodOfAtos), 1100).
%price(recipe(orchidMalevolence), 775).
%price(recipe(refresherOrb), 1800).
%price(recipe(crimsonGuard), 600).
%price(recipe(aeonDisk), 1350).
%price(recipe(blackKingBar), 1375).
%price(recipe(shivasGuard), 650).
%price(recipe(linkensSphere), 1200).
%price(recipe(mantaStyle), 900).
%price(recipe(assaultCuirass), 1300).
%price(recipe(crystalys), 500).
%price(recipe(armletOfMordiggian), 550).
%price(recipe(skullBasher), 1150).
%price(recipe(radiance), 1350).
%price(recipe(daedalus), 1000).
%price(recipe(silverEdge), 700).
%price(recipe(abyssalBlade), 1550).
%price(recipe(bloodthorn), 1000).
%price(recipe(sange), 500).
%price(recipe(yasha), 500).
%price(recipe(kaya), 500).
%price(recipe(maelstrom), 700).
%price(recipe(diffusalBlade), 700).
%price(recipe(mjollnir), 900).
