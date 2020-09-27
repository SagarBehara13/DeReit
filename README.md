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
* The smart access the data which is of-chain.
```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/RealEstateData.png">

```
* Head over to RealEstateToken.sol, This is where the tokenization happens

* The deployment expects 2 args, pass the contract address of the RealEstateConsumer.sol and the name of the real Estate to be tokenized

* Deploy the contract, you can see the real estate  property has been tokenized.

* The property is tokenized on the basises of its surface area
```
<img src="https://github.com/SagarBehara13/DeReit/blob/master/images/totalSupply.png">
