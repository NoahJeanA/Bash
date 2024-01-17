#!/bin/bash
START=$(date +%s)
superechoDatei="$HOME/Shellschnitzeljagd.txt"
echo '#superecho = used to change text colour
superecho() {
	case "$1" in
	red)
		echo -e "\e[40;31;1m$2\e[0m"
		;;
	redblink)
		echo -e "\e[40;31;1;5m$2\e[0m"
		;;
	white)
		echo -e "\e[97;40;1m$2\e[0m"
		;;
	green)
		echo -e "\e[92;40;1m$2\e[0m"
		;;
	greenblink)
		echo -e "\e[40;32;1;5m$2\e[0m"
		;;
	orange)
		echo -e "\e[33;1m$2\e[0m"
		;;
	esac
}' >"$superechoDatei"

source "$superechoDatei"

#=======

ersterOrdner="ersterOrdner"
liesMichEins=$ersterOrdner"/liesMich"
liesMichVersteckt=$ersterOrdner"/.liesMich"
ausfuehrenVersteckt=$ersterOrdner"/.nachDemLesenAusfuehren.sh"

zweiterOrdner="zweiterOrdner"
ausfuehrenZwei=$zweiterOrdner"/fuehrMichAus.sh"

dritterOrdner="dritterOrdner"
benoetigt="cow"
benoetigtZwei="dog"
liesMichDrei=$dritterOrdner"/liesMich"
ausfuehrenVerstecktDrei=$dritterOrdner"/.ausfuehren.sh"

vierterOrdner="letzterOrdner"
ausfuehrenVier="letzterOrdner/lastButNotLeast.sh"
lesenVier="letzterOrdner/liesMich.exe"
txtURL="https://digitalcampus.mittwald.de/wp-content/uploads/2022/01/loremIpsum.txt"

if [ -d "$ersterOrdner" ]; then
	rm -R "$ersterOrdner"
fi

initial() {
	mkdir "$ersterOrdner"
	superecho white "Sehr gut! Allerdings befinden sich in diesem Ordner hier noch mehr Dateien... Ist der 13. in diesem Monat eigentlich ein Freitag? 

Nächste Aufgaben:
1. Den Befehl 'cal' ausführen. Was macht der Befehl?
2. Die Manpage zu 'ls' überfliegen (Befehl: 'man ls'), um ...
3. ... Dir auch die versteckten Dateien anzeigen zu lassen (mit 'ls' möglich, allerdings wird noch etwas mehr benötigt...).
4. Den Inhalt der versteckten '.liesMich' anzeigen lassen." >"$liesMichEins"

	superecho white "Du hast mich gefunden!

Deine nächste Aufgabe:
1. Den Befehl 'gzip liesMich' ausführen und den Inhalt des Ordners ausgeben lassen. Was macht der Befehl?
2. Die veränderte Datei in ihren alten Zustand zurückführen. 
3. Das versteckte Skript in diesem Ordner ('.nachDemLesenAusfuehren.sh') ausführen. 

Bash-Skripte erkennst Du immer an der '.sh'-Endung. Linux selbst benötigt diese nicht, allerdings hilft sie uns Menschen, zu erkennen, um was für Dateien es sich handelt. So hätten die 'liesMich'-Dateien auch eine '.txt'-Endung haben können. Linux wär's egal." >"$liesMichVersteckt"

	cat <<REALENDONE >"$ausfuehrenVersteckt"
#!/bin/bash
source "$superechoDatei"
mkdir -p "$zweiterOrdner"
cat <<'REALENDTWO' >"$ausfuehrenZwei"
#!/bin/bash
source "$superechoDatei"
if [ -f "$benoetigt" ]; then
	cowsay "Hallöle! Ich habe neue Aufgaben für Dich! Geh in den Ordner 'dritterOrdner' und lass Dir den Inhalt von 'liesMich' ausgeben!" > cow || { echo "Oh nein, scheinbar kennt dein System das Paket cowsay noch nicht... Installiere es und führ' das Skript nochmal aus!"; exit 1; }
	mkdir "$dritterOrdner"
	superecho orange "Uiuiui, weißt Du überhaupt noch wo Du bist, bei den ganzen Ordnern?

Deine nächsten Aufgaben:
1. Den Befehl 'pwd' ausführen. Was macht der Befehl?
2. Das hier versteckte Skript '.ausfuehren.sh' ausführen!" > "$liesMichDrei"
	cat <<'REALENDTHREE' >"$ausfuehrenVerstecktDrei"
#!/bin/bash
source "$superechoDatei"
if [ -d "$vierterOrdner" ]; then
	superecho orange "Und schon wieder ein neuer Ordner...

Deine nächsten Aufgaben:
1. In den letzten Ordner gehen.
2. Die Aufgaben, die in der 'liesMich.exe' stehen, bewältigen."
	superecho white "Du bist fast am Ziel!

Deine nächsten Aufgaben:
1. Das Skript 'lastButNotLeast.sh' ausführen
2. Es gibt verschieden Möglichkeiten zum Auslesen von Dateien. Lies die Datei 'loremIpsum' mit folgenden Befehlen: 
    'cat loremIpsum'
    'less loremIpsum'
    'more loremIpsum'
    'head -n 1 loremIpsum'
    'tail -n 1 loremIpsum'
Wie unterscheiden sich die Befehle?
2. In der heruntergeladenen Datei 'loremIpsum' das Wort 'inceptos' suchen (Tipp: 'grep'). Das Wort kommt 2x in der Datei vor. Lasse Dir mithilfe einer Option von grep ebenfalls die Zeilenangaben ausgeben, in denen das Wort vorkommt. 
3. Du denkst, Du hast die beiden Zeilen? Dann überprüfe Dein Ergebnis, indem Du beim zweiten Kapitel des Kurses ('Das Ende') die beiden Zeilen eingibst." >"$lesenVier"

	cat <<'REALENDFOUR' >"$ausfuehrenVier"
#!/bin/bash
source "$superechoDatei"
superecho orange "Sehr gut! Jetzt wird eine kleine Text-Datei runtergeladen, mit der Du gleich spielen darfst! Der Befehl wird in wenigen Sekunden ausgeführt, Du musst also nichts machen!
Der Befehl, der gleich ausgeführt wird, lautet übrigens: wget -O loremIpsum <geheimeURL>\n"
sleep 15
wget --no-check-certificate "$txtURL" -O "loremIpsum"
cowsay "Download abgeschlossen!"
END=$(date +%s)
DIFF=$(($END - $START))
superecho greenblink "It took $DIFF seconds"
REALENDFOUR

elif [[ -f "$benoetigtZwei" && -f "../"$benoetigt ]]; then
	superecho orange "Sehr gut! Jetzt haben wir aber immer noch eine Kuh zu viel...

Deine nächsten Aufgaben:
1. Die Datei 'cow' im Ordner 'zweiterOrdner' löschen.
2. Das Skript nochmal ausführen."
elif [[ -f "$benoetigtZwei" && "\$(cat "$benoetigtZwei")" == "cat" ]]; then
	superecho green "Wow, richtig!

Deine nächsten Aufgaben:
1. Den vierten und letzten Ordner '$vierterOrdner' anlegen.
2. Das Skript nochmal ausführen."
elif [ -f "$benoetigtZwei" ]; then
	echo "" > "$benoetigtZwei"
	superecho orange "Das war's mit der Kuh... Aber wo war eigentlich der Hund?

Deine nächsten Aufgaben:
1. Den Befehl 'find ../.. -name dog' ausführen. Was macht der Befehl?
2. Das Wort 'cat' in die Datei 'dog' schreiben.
3. Das Skript nochmal ausführen."
else
	if [ -f "$benoetigt" ]; then
		superecho green "Du bist schon richtig gut auf der Kommandozeile unterwegs, da kommt Dein System bestimmt ins Schwitzen. Oder?

Deine nächsten Aufgaben:
1. Den Befehl 'top' ausführen. Was macht der Befehl?
2. Die Datei 'cow' in 'dog' umbenennen.
3. Das Skript nochmal ausführen."
	else
		superecho orange "Das Skript benötigt hier scheinbar noch etwas...

Deine nächsten Aufgaben:
1. Die Datei 'cow' aus 'zweiterOrdner' in diesen Ordner kopieren (nenne sie hier auch 'cow').
2. Das Skript nochmal ausführen."
	fi
fi
REALENDTHREE

	superecho green "Das hat geklappt! Weißt Du eigentlich, auf was für einem System Du hier arbeitest?

Deine nächsten Aufgaben:
1. Den Befehl 'uname -a' ausführen. Was macht der Befehl?
2. Den Inhalt der Datei 'cow' ausgeben lassen." 
else
	superecho orange "Es scheint, als bräuchte das Skript hier noch etwas...

Deine nächsten Aufgaben:
1. Eine leere Datei namens 'cow' anlegen.
2. Das Skript nochmal ausführen."
fi
REALENDTWO

superecho orange "So viele Befehle schon, weißt Du überhaupt noch, was Du bisher schon alles gemacht hast?

Deine nächsten Aufgaben:
1. Den Befehl 'history' ausführen. Was macht der Befehl?
2. In den neuen Ordner gehen.
3. Den Inhalt des neuen Ordners ausgeben lassen.
4. Mit den Dateien dort arbeiten!"
REALENDONE

	notify-send 'Es hat geklappt!' 'Du kannst jetzt loslegen.'
	superecho green "Das Einrichten der Testumgebung hat geklappt, sehr gut!

Deine nächsten Aufgaben:
1. Den Inhalt deines aktuellen Ordners anzeigen lassen.
2. In den hier neu angelegten Ordner ('ersterOrdner') wechseln.
3. Den Inhalt des Ordners 'ersterOrdner' ausgeben lassen.
Tipp: Inhalte von 'liesMich'-Dateien können immer hilfreich sein..."
}

initial || echo "Hier ist irgendetwas schief gelaufen...HILFE"
