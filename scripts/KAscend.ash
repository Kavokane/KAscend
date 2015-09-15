// KAscend.ash - Kavok
// Credits to come

script "KAscend.ash - v0.29";
notify Kavok;

print("Your game says it's day "+my_daycount()+". Select day to run:");
print("When asked to overdrink, 1 will make you overdrink while anything else will let you do it yourself");

boolean doCLI(string cmd)
{
	try{ cli_execute(cmd); }
	finally {return true;}
	return false;
}

boolean odeToBoozeMe(int overdrink)
{
	if ((my_inebriety() == 14 && overdrink == 0) || (my_inebriety() > 14)) return true;
	if (my_mp() < 50) doCLI("rest free"); else print("You have enough mana, skipping rest");
	if (my_mp() >= 50) use_skill(1, $skill[The Ode to Booze]); else doCLI("cast ode to booze");
	return true;
}

int advCost(int whichtest) {
	buffer page = visit_url("council.php");
	string teststr = "name=option value="+ whichtest +">";
	if (contains_text(page, teststr)) {
		int chars = 140; //chars to look ahead
		string pagestr = substring(page, page.index_of(teststr)+length(teststr), page.index_of(teststr)+length(teststr)+chars);
		string advstr = substring(pagestr, pagestr.index_of("(")+1, pagestr.index_of("(")+3);
		advstr = replace_string(advstr, " ", ""); //removes whitespace, if the test is < 10 adv
		return to_int(advstr);
	} else {
		print("Didn't find specified test on the council page. Already done?");
		return 99999;
	}
}

boolean doTest(int which) {
	if (my_adventures() >= advCost(which)) {
		print("Undertaking community service task at a cost of " + advCost(which) + " adventures", "blue");
		visit_url("choice.php?whichchoice=1089&option="+which+"&pwd="+my_hash());
		return true;
	} else {
		abort("Failed to generate enough adventures to complete test " + which);
		return false;
	}
}

void main(int day, int overdrink)
{
	string page;
	switch(day)
	{
		case 0: print("EXITING");
		break;
		
		case 1: print("Starting Day 1"); //====================================================================================================
		//do stuff
		page = visit_url("tutorial.php?action=toot");
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

		odeToBoozeMe(overdrink);
		odeToBoozeMe(overdrink);
		odeToBoozeMe(overdrink);
		
		doCLI("drink ice island long tea");
		doCLI("drink sockdollager");
		doCLI("drink sockdollager");
		doCLI("acquire 2 Strikes Again Bigmouth");
		doCLI("drink Strikes Again Bigmouth");
		doCLI("drink Strikes Again Bigmouth");
		
		doCLI("eat sleeping dog");
		doCLI("acquire this charming flan");
		doCLI("eat this charming flan");
		doCLI("acquire snow crab");
		doCLI("eat snow crab");
		
		//DO COIL SERVICE
		page = visit_url("council.php"); //initial message that the council is in jail
		//page = visit_url("choice.php?whichchoice=1089&option=11&pwd");
		doTest(11);
		doCLI("use a ten-percent bonus");
		
		doCLI("chew astral energy drink"); //doing later for more adventures
		
		odeToBoozeMe(overdrink);
		doCLI("drink sockdollager");
		
		maximize("weapon damage", false);
		//DO WEAPON DAMAGE SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=6&pwd");
		doTest(6);
		doCLI("eat weird gazelle steak");
		
		maximize("item drop", false);
		doCLI("cheat The Wheel of Fortune");
		//DO ITEM DROP SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=9&pwd");
		doTest(9);
		
		odeToBoozeMe(overdrink);
		odeToBoozeMe(overdrink);
		
		//expend free rests here
		for i from 0 to 10 { doCLI("rest free"); }
		
		if (overdrink == 1) doCLI("overdrink emergency margarita");
		
		maximize("adv", false);
		print("Done with Day 1 - don't waste the margarita buff on turn 1 of day 2!");
		break;
		
		case 2: print("Starting Day 2"); //====================================================================================================
		//do day 2 stuff
		page = visit_url("council.php"); //get this set first?
		doCLI("cheat wrench");
		doCLI("cheat lead pipe");
		odeToBoozeMe(overdrink);
		doCLI("drink sockdollager");
		maximize("spell damage", false);
		//DO SPELL DAMAGE SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=7&pwd");
		doTest(7);
    
		if (my_mp() < 6) doCLI("rest free"); else print("You have enough mana, skipping rest");
		use_skill(3, $skill[summon smithsness]);
		if (item_amount($item[flaskfull of hollow]) == 3) use(3, $item[flaskfull of hollow]);
		doCLI("smith vicar's tutu");
    
		doCLI("garden pick");
		doCLI("acquire ice island long tea");
		doCLI("acquire 2 Strikes Again Bigmouth");
		if (my_fullness() < 5) doCLI("acquire this charming flan");
		if (my_fullness() < 5) doCLI("eat this charming flan");
		odeToBoozeMe(overdrink);
		odeToBoozeMe(overdrink);
		doCLI("drink ice island long tea");
		doCLI("drink Strikes Again Bigmouth");
		doCLI("drink Strikes Again Bigmouth");
    
		doCLI("drink Ish Kabibble"); //for resist service
		if (my_fullness() < 5) doCLI("eat wet dog");
		doCLI("eat sausage without a cause");
		maximize("hot res", false);
		//DO HOT RES SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=10&pwd");
		doTest(10);
    
		maximize("hp", false);
		//DO HP SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=1&pwd");
		doTest(1);
    
		doCLI("chew blood-drive sticker");
		odeToBoozeMe(overdrink);
		doCLI("drink Bee's Knees");
		doCLI("cheat strength"); //before strength service
		maximize("mus", false);
		//DO MUS SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=2&pwd");
		doTest(2);

		odeToBoozeMe(overdrink);
		odeToBoozeMe(overdrink);
		//expend free rests here
		for i from 0 to 10 { doCLI("rest free"); }
		if (overdrink == 1) doCLI("overdrink vintage smart drink");
    
		maximize("adv", false);
		print("Done with Day 2 - don't waste the water buff!");
		break;
		
		case 3: print("Starting Day 3"); //====================================================================================================
		//do day 3 stuff
		page = visit_url("council.php"); //get this set first?
		doCLI("cheat rope");
		
		odeToBoozeMe(overdrink);
		doCLI("drink hotsocks");
		maximize("familiar weight", false);
		//DO FAMLIAR WEIGHT SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=5&pwd");
		doTest(5);
    
		//normal prep here
		if (my_mp() < 6) doCLI("rest free"); else print("You have enough mana, skipping rest");
		use_skill(3, $skill[summon smithsness]);
		if (item_amount($item[flaskfull of hollow]) == 3) use(3, $item[flaskfull of hollow]);
		doCLI("chew astral energy drink");
		doCLI("garden pick");
		doCLI("acquire ice island long tea");
		doCLI("acquire Strikes Again Bigmouth");
		doCLI("acquire 2 this charming flan");
		doCLI("eat this charming flan");
		doCLI("eat this charming flan");
		doCLI("acquire 2 snow crab");
		doCLI("eat snow crab");
		doCLI("eat snow crab");
		odeToBoozeMe(overdrink);
		odeToBoozeMe(overdrink);
		doCLI("drink ice island long tea");
		doCLI("drink Strikes Again Bigmouth");
    
		odeToBoozeMe(overdrink);
		doCLI("drink Bee's Knees");
		doCLI("cheat Magician"); //before myst service
		maximize("myst", false);
		doCLI("use bag of grain");
		//DO MYST SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=3&pwd");
		doTest(3);

		odeToBoozeMe(overdrink);
		doCLI("drink Bee's Knees");
		doCLI("cheat fool"); //before strength service
		maximize("mox", false);
		doCLI("use pocket maze");
		//DO MOX SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=4&pwd");
		doTest(4);
    
		maximize("-combat", false);
		doCLI("use shady shades");
		doCLI("use squeaky toy rose");
		//DO -COMBAT SERVICE
		//page = visit_url("choice.php?whichchoice=1089&option=8&pwd");
		doTest(8);
    
		print("YAY DONE!");
		break;
	}

}