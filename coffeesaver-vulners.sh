echo -e "\033[0m\n*GODZILLA*\n\033[0;32mGGggGGggGG\nooOOooOOoo\nDDddDDddDD\nzzZZzzZZzz\nIIiiIIiiII\nllLLllLLll\nLLllLLllLL\naaAAaaAAaa\033[0m\n*GODZILLA*"
nmap -sP $1 -oG $2.txt
cat $2.txt | grep "Up" | cut -d " " -f2 > livehost.txt

for i in $(cat livehost.txt);
do
  echo -e "running vulners on $i"
  going="${i}-vulners"
  nmap --script nmap-vulners -sV $i > $going.txt
done

