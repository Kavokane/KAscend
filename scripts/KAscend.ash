// KAscend.ash - Kavok
// Credits to come

script "KAscend.ash";
notify Kavok;

print("Your game says it's day "+my_daycount()+". Select day to run:");
print("When asked to overdrink, 1 will make you overdrink while anything else will let you do it yourself");

boolean doCLI(string cmd)
{
	try{ cli_execute(cmd); }
	finally {return true;}
	return false;
}

boolean odeToBoozeMe()
{
	if (my_mp() < 50) doCLI("rest free"); else print("You have enough mana, skipping rest");
	if (my_mp() >= 50) use_skill(1, $skill[The Ode to Booze]); else print("Something broke trying to cast ode");
	return true;
}

void main(int day, int overdrink)
{

	switch(day)
	{
		case 0: print("EXITING");
		break;
		
		case 1: print("Starting Day 1"); //====================================================================================================
		//do stuff
		doCLI("use newbiesport tent");
		doCLI("equip astral bracer");
		visit_url("tutorial.php?action=toot");
		if (item_amount($item[letter from King Ralph XI]) > 0) use(1, $item[letter from King Ralph XI]);
		if (item_amount($item[pork elf goodies sack]) > 0) use(1, $item[pork elf goodies sack]);
		foreach stone in $items[hamethyst, baconstone, porquoise] autosell(item_amount(stone), stone);
		if (item_amount($item[carton of astral energy drinks]) > 0) use(1, $item[carton of astral energy drinks]);
		doCLI("cheat 1952");
		doCLI("cheat empress");
		autosell(1, $item[1952 mickey mantle card]);
		if (item_amount($item[toy accordion]) == 0) buy(1, $item[toy accordion]);
		if (item_amount($item[third-hand lantern]) == 0) buy(1, $item[third-hand lantern]);
		if (item_amount($item[maiden wig]) == 0) buy(1, $item[maiden wig]);
		if (my_mp() < 6) doCLI("rest free"); else print("You have enough mana, skipping rest");
		use_skill(3, $skill[summon smithsness]);
		if (item_amount($item[flaskfull of hollow]) == 3) use(3, $item[flaskfull of hollow]);
		doCLI("smith work is a four letter sword");
		doCLI("smith a light that never goes out");
		doCLI("smith hairpiece on fire");
		equip($item[work is a four letter sword]);
		equip($item[a light that never goes out]);
		equip($item[hairpiece on fire]);
		doCLI("garden pick");
		doCLI("acquire ice island long tea");

		odeToBoozeMe();
		odeToBoozeMe();
		odeToBoozeMe();
		
		doCLI("drink ice island long tea");
		doCLI("drink sockdollager");
		doCLI("drink sockdollager");
		doCLI("acquire Strikes Again Bigmouth");
		doCLI("acquire Strikes Again Bigmouth");
		doCLI("drink Strikes Again Bigmouth");
		doCLI("drink Strikes Again Bigmouth");
		
		doCLI("eat sleeping dog");
		doCLI("acquire this charming flan");
		doCLI("eat this charming flan");
		doCLI("acquire snow crab");
		doCLI("eat snow crab");
		
		//DO COIL SERVICE
		visit_url("council.php"); //initial message that the council is in jail
		visit_url("choice.php?whichchoice=1089&option=11&pwd");
		doCLI("use a ten-percent bonus");
						
		doCLI("chew astral energy drink"); //doing later for more adventures
		
		odeToBoozeMe();
		doCLI("drink sockdollager");
		
		doCLI("maximize weapon damage");
		//DO WEAPON DAMAGE SERVICE
		visit_url("choice.php?whichchoice=1089&option=6&pwd");
		doCLI("eat weird gazelle steak");
		
		doCLI("maximize item drop");
		doCLI("cheat The Wheel of Fortune");
		//DO ITEM DROP SERVICE
		visit_url("choice.php?whichchoice=1089&option=9&pwd");
		
		odeToBoozeMe();
		odeToBoozeMe();
		
		//expend free rests here
		for i from 0 to 10 { doCLI("rest free"); }
		
		if (overdrink == 1) doCLI("overdrink emergency margarita");
		
		doCLI("maximize adv");
		print("Done with Day 1 - don't waste the margarita buff on turn 1 of day 2!");
		break;
		
		case 2: print("Starting Day 2"); //====================================================================================================
		//do day 2 stuff
		visit_url("council.php"); //get this set first?
		doCLI("cheat wrench");
		doCLI("cheat lead pipe");
		odeToBoozeMe();
		doCLI("drink sockdollager");
		doCLI("maximize spell damage");
		//DO SPELL DAMAGE SERVICE
		visit_url("choice.php?whichchoice=1089&option=7&pwd");
    
		if (my_mp() < 6) doCLI("rest free"); else print("You have enough mana, skipping rest");
		use_skill(3, $skill[summon smithsness]);
		if (item_amount($item[flaskfull of hollow]) == 3) use(3, $item[flaskfull of hollow]);
		doCLI("smith vicar's tutu");
    
		doCLI("garden pick");
		doCLI("acquire ice island long tea");
		doCLI("acquire Strikes Again Bigmouth");
		doCLI("acquire Strikes Again Bigmouth");
		doCLI("acquire this charming flan");
		doCLI("eat this charming flan");
		odeToBoozeMe();
		odeToBoozeMe();
		doCLI("drink ice island long tea");
		doCLI("drink Strikes Again Bigmouth");
		doCLI("drink Strikes Again Bigmouth");
    
		doCLI("drink Ish Kabibble"); //for resist service
		doCLI("eat wet dog");
		doCLI("eat sausage without a cause");
		doCLI("maximize hot res");
		//DO HOT RES SERVICE
		visit_url("choice.php?whichchoice=1089&option=10&pwd");
    
		doCLI("maximize hp");
		//DO HP SERVICE
		visit_url("choice.php?whichchoice=1089&option=1&pwd");
    
		doCLI("chew blood-drive sticker");
		odeToBoozeMe();
		doCLI("drink Bee's Knees");
		doCLI("cheat strength"); //before strength service
		doCLI("maximize mus");
		//DO MUS SERVICE
		visit_url("choice.php?whichchoice=1089&option=2&pwd");

		odeToBoozeMe();
		odeToBoozeMe();
		//expend free rests here
		for i from 0 to 10 { doCLI("rest free"); }
		if (overdrink == 1) doCLI("overdrink vintage smart drink");
    
		doCLI("maximize adv");
		print("Done with Day 2 - don't waste the water buff!");
		break;
		
		case 3: print("Starting Day 3"); //====================================================================================================
		//do day 3 stuff
		visit_url("council.php"); //get this set first?
		doCLI("cheat rope");
		
		odeToBoozeMe();
		doCLI("drink hotsocks");
		doCLI("maximize familiar weight");
		//DO FAMLIAR WEIGHT SERVICE
		visit_url("choice.php?whichchoice=1089&option=5&pwd");
    
		//normal prep here
		if (my_mp() < 6) doCLI("rest free"); else print("You have enough mana, skipping rest");
		use_skill(3, $skill[summon smithsness]);
		if (item_amount($item[flaskfull of hollow]) == 3) use(3, $item[flaskfull of hollow]);
		doCLI("chew astral energy drink");
		doCLI("garden pick");
		doCLI("acquire ice island long tea");
		doCLI("acquire Strikes Again Bigmouth");
		doCLI("acquire this charming flan");
		doCLI("acquire this charming flan");
		doCLI("eat this charming flan");
		doCLI("eat this charming flan");
		doCLI("acquire snow crab");
		doCLI("acquire snow crab");
		doCLI("eat snow crab");
		doCLI("eat snow crab");
		odeToBoozeMe();
		odeToBoozeMe();
		doCLI("drink ice island long tea");
		doCLI("drink Strikes Again Bigmouth");
    
		odeToBoozeMe();
		doCLI("drink Bee's Knees");
		doCLI("cheat Magician"); //before strength service
		doCLI("maximize myst");
		doCLI("use bag of grain");
		//DO MYST SERVICE
		visit_url("choice.php?whichchoice=1089&option=3&pwd");

		odeToBoozeMe();
		doCLI("drink Bee's Knees");
		doCLI("cheat fool"); //before strength service
		doCLI("maximize mox");
		doCLI("use pocket maze");
		//DO MOX SERVICE
		visit_url("choice.php?whichchoice=1089&option=4&pwd");
    
		doCLI("maximize -combat");
		doCLI("use shady shades");
		doCLI("use squeaky toy rose");
		//DO -COMBAT SERVICE
		visit_url("choice.php?whichchoice=1089&option=8&pwd");
    
		print("YAY DONE!");
		break;
	}

}