# #chainlink-hackathon
<h1 align="center">DeReit</h1>
DeReit is a decentralized platform for buying real estate properties via the Ethereum blockchain. It allows investors to diversify their exposure to the real estate market with a low capital and minimum risk.<br><br>

* DeReit grabs the real estate related data from the outside world and feeds the data in the smart contract with the help of external adapters
* https://github.com/SagarBehara13/realEstate-adaptar The external Adapter that feeds the data.<br><br>

<h2 align="center">Basic Architecture</h2>
<img src="https://github.com/SagarBehara13/chainlink-hackathon/blob/master/images/chainLinkReal.png">

* DeReit calculates the amount of tokens generation on the basises of real estate properties surface area.
* Tokens minted can be bought and the bought addresses are termed as shareholders. 
* On the basis of a share(token) possesed by the user, The montly rent is distributed to the users.<br></br>

<h2 align="center">Basic Rent Distribution</h2>
<img src="https://github.com/SagarBehara13/chainlink-hackathon/blob/master/images/Untitled_Artwork%2025.png">

* DeReit has a user interface to mint,buy,view tokenized property.
* https://github.com/adamazad/dereit-web The frontend for DeReit.
<h2 align="center"> Example Interface </h2>
<img src="https://github.com/SagarBehara13/chainlink-hackathon/blob/master/images/Frontend.png"><br></br>

## Steps to test
```
* Open the remmix folder, copy the scripts into the remix editor https://remix.ethereum.org/

* Add the scripts into the remix editor.

* The data is being grabbed from the server and an externa adapter feeds the data into the contract.

* Head to the RealEstateConsumerApi and deploy it into the remix.

* Call the realEstateData function, The function expects real estate property name, example [ 'Mannat', 'Taj' ] choose any one.

```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/apiFunctionCall.png">

```
* Once the transaction is sucessfull.
* The smart contract has access to data which is of-chain.

```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/RealEstateData.png">

```
* Head over to RealEstateToken.sol, This is where the tokenization happens.

* The deployment expects 2 args, pass the contract address of the RealEstateConsumerApi.sol and the name of the real estate to be tokenized.

* Deploy the contract, you can see the real estate  property has been tokenized.

* The property is tokenized on the basises of its surface area.
```

<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/DeployContract.png">

<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/TotalShares.png">

```
* Approve the tokens for sale.
```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/Approve%20Token.png">

```
* Once the token are approved. You can but tokens.
```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/ByToken.png">

```
* The person(benificary address) who buys the token becomes the shareholder of the tokenized property.
```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/isShareHolder.png">

```
* You can view the reaming shares which can be bought.
```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/remainingShares.png">
```
* Calculate the profit earned by the benificary address
```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/Calculate%20Profit%20by%20Month.png"><br></br>
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/ProfitbyMonth.png">

* Overall Values
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/Frontend.png">

## Future Scope
* Complete deployment and migration in truffle.
* Automatic Distribution of rent with the help of chainlink-alarm
