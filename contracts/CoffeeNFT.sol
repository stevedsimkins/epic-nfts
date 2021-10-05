
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

  constructor() ERC721 ("Crypto Coffees", "CRYPTOCOFFEES") {
    console.log("This is my Coffee NFT contract!");
  }

  function getTotalMinted() public view returns (uint256) {
    return _tokenIds.current();
  }

  uint256 private _maxTokens = 50; 

  function makeAnEpicNFT() public {
    uint256 newItemId = _tokenIds.current();

    require(newItemId < _maxTokens, "Max tokens have beeb minted.");

    
    string memory finalTokenUri = string(
      abi.encodePacked("data:application/json;base64,ewogICAgIm5hbWUiOiAiQ3J5cHRvIENvZmZlZSIsCiAgICAiZGVzY3JpcHRpb24iOiAiQSBDb2ZmZWUgbWFkZSBieSBubyBvdGhlciB0aGFuIHRoZSBORlQgQmFyaXN0YSIsCiAgICAiaW1hZ2UiOiAiaHR0cHM6Ly9nYXRld2F5LnBpbmF0YS5jbG91ZC9pcGZzL1FtYW1zbUVGcWdzeWV5Z2Z2SDJRM3pnUlZLVU5qQXJHUml3Wkd5Wlk4WEpNQ1giCn0=")
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
