$count = 0;
$battle = 0;
sub EVENT_ENTERZONE {
    $client->Message(4, "Waiting for other players to join. Please be patient...");
    $count++;    
    $client->Message(4, $count);
    $client->Message(4, $battle);
    if ($count == 2 && $battle == 0) {
	quest::shout("Battle starting in 5 minutes...");
	$battle = 1;
    }
    elsif ($count >= 3 && $battle == 0) {
	quest::shout("I have joined the battle!");
    }
}

sub EVENT_ZONE {
    $count--;
    if ($count <= 1 && $battle == 1) {
	quest::shout2("winner winner chicken dinner");
	$battle = 0;
	quest::shout($count);
	quest::shout($battle);
    }
}
