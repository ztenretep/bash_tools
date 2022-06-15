#!/usr/bin/bash
#
# This tool can be used to query the 2miners.com pool.
#
# Exchange <etc-wallet-id> with your wallet id (ETC address)

# Set wallet id.
walletid="<etc-wallet-id>"

# Set API url.
URL="https://etc.2miners.com/api/accounts/${walletid}"

# Get response.
response=$(curl -s "${URL}" | jq)

# Write response as json to screen.
#echo "${response}" | jq '.'

# Get some values.
sharesvalid=$(echo "${response}" | jq '.sharesValid')
currenthashrate=$(echo "${response}" | jq '.currentHashrate')
hashrate=$(echo "${response}" | jq '.hashrate')
balance=$(echo "${response}" | jq '.stats.balance')
immature=$(echo "${response}" | jq '.stats.immature')
luck=$(echo "${response}" | jq '.currentLuck')
minpayout=$(echo "${response}" | jq '.config.minPayout')

# Set divisor.
DIV_ETH=1000000000

# Convert luck.
luck=$(echo "${luck}" | bc)

# Make some calculations.
balance=$(bc <<< "scale=9; $balance/$DIV_ETH" | sed 's/^\./0./')
immature=$(bc <<< "scale=9; $immature/$DIV_ETH" | sed 's/^\./0./')
hashrate=$(bc <<< "scale=9; ($hashrate/$DIV_ETH)*1000" | sed 's/^\./0./')
minpayout=$(bc <<< "scale=9; $minpayout/$DIV_ETH" | sed 's/^\./0./')
currenthash=$(bc <<< "scale=9; ($currenthashrate/$DIV_ETH)*1000" | sed 's/^\./0./')
luck=$(bc <<< "scale=9; $luck*100" | sed 's/^\./0./')

# Print everything to the screen.
printf "%-20s %s\n" "Valid shares:" "${sharesvalid}"
printf "%-20s %s %s\n" "Current Hashrate:" "${currenthash}" "Mh/s"
printf "%-20s %s %s\n" "Average Hashrate:" "${hashrate}" "Mh/s"
printf "%-20s %s %s\n" "Personal Luck:" "${luck}" "%"
printf "%-20s %s %s\n" "Unpaid Balance:" "${balance}" "ETC"
printf "%-20s %s %s\n" "Unconfirmed Balance:" "${immature}" "ETC"
printf "%-20s %s %s\n" "Minimum Payout:" "${minpayout}" "ETC"


