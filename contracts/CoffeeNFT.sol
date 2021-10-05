
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

// We need some util functions for strings.
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import {Base64} from "./libraries/Base64.sol";

contract CoffeeNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  event NewEpicNFTMinted(address sender, uint256 tokenId); 

  constructor() ERC721 ("Crypto Coffee", "CRYPTOCOFFEE") {
    console.log("This is my Coffee NFT contract!");
  }

  function getTotalMinted() public view returns (uint256) {
    return _tokenIds.current();
  }

  uint256 private _maxTokens = 50; 

  function makeAnEpicNFT() public {
    uint256 newItemId = _tokenIds.current();

    require(newItemId < _maxTokens, "Max tokens have beeb minted.");

    
    string memory json = Base64.encode(
        bytes(
            string(
                abi.encodePacked(
                    '{"name": "Crypto Coffee", 
                      "description": "An coffee drink made by NFT Barista", 
                      "image": "ifps://QmamsmEFqgsyeygfvH2Q3zgRVKUNjArGRiwZGyZY8XJMCX/coffee.png"}'
                )
            )
        )
    );

    string memory finalTokenUri = string(
      abi.encodePacked("data:application/json;base64,", json)
    );

    console.log("\n--------------------");
    console.log(finalTokenUri);
    console.log("--------------------\n");

    
    _safeMint(msg.sender, newItemId);
    
    // Update your URI!!!
    _setTokenURI(newItemId, finalTokenUri);
  
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    emit NewEpicNFTMinted(msg.sender, newItemId);
  }
} 
