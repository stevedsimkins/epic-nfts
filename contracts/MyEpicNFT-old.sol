// SPDX-License-Identifier: UNLICENSED 

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is my NFT contract!");
  }

  function makeAnEpicNFT() public {
    uint256 newItemId = _tokenIds.current();
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, "data:application/json;base64,ewogICJuYW1lIjogIkVwaWNMb3JkSGFtYnVyZ2VyIiwKICAiZGVzY3JpcHRpb24iOiAiQW4gTkZUIGZyb20geW91ciBidXR0IiwKICAiaW1hZ2UiOiAiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQSE4yWnlCNGJXeHVjejBpYUhSMGNEb3ZMM2QzZHk1M015NXZjbWN2TWpBd01DOXpkbWNpSUhCeVpYTmxjblpsUVhOd1pXTjBVbUYwYVc4OUluaE5hVzVaVFdsdUlHMWxaWFFpSUhacFpYZENiM2c5SWpBZ01DQXpOVEFnTXpVd0lqNEtJQ0FnSUR4emRIbHNaVDR1WW1GelpTQjdJR1pwYkd3NklISmxaRHNnWm05dWRDMW1ZVzFwYkhrNklITmxjbWxtT3lCbWIyNTBMWE5wZW1VNklERTRjSGc3SUgwOEwzTjBlV3hsUGdvZ0lDQWdQSEpsWTNRZ2QybGtkR2c5SWpFd01DVWlJR2hsYVdkb2REMGlNVEF3SlNJZ1ptbHNiRDBpWW14aFkyc2lJQzgrQ2lBZ0lDQThkR1Y0ZENCNFBTSTFNQ1VpSUhrOUlqVXdKU0lnWTJ4aGMzTTlJbUpoYzJVaUlHUnZiV2x1WVc1MExXSmhjMlZzYVc1bFBTSnRhV1JrYkdVaUlIUmxlSFF0WVc1amFHOXlQU0p0YVdSa2JHVWlQa1Z3YVdOTWIzSmtTR0Z0WW5WeVoyVnlQQzkwWlhoMFBnbzhMM04yWno0PSIKfQ==");
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    _tokenIds.increment();
  }
}
