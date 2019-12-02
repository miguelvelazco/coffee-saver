echo -e "\033[0m\n*GODZILLA*\n\033[0;32mGGggGGggGG\nooOOooOOoo\nDDddDDddDD\nzzZZzzZZzz\nIIiiIIiiII\nllLLllLLll\nLLllLLllLL\naaAAaaAAaa\033[0m\n*GODZILLA*"

echo -e "creating scans folder"
mkdir -p scans/

nmap -sP $1 -oG $2.txt
cat $2.txt | grep "Up" | cut -d " " -f2 > livehost.txt

for i in $(cat livehost.txt);
do
  echo -e "running ms smb check on $i"
  smbchecker="${i}-smb-ms-check"
  nmap --script smb-vuln-ms* -vvv $i | tee scans/$smbchecker.txt
done
