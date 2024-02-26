// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FactoryArt is ERC721, Ownable(msg.sender) {

  struct Artwork {
    string name;
    string url; 
  }

  mapping(uint256 => Artwork) public artworks;

  uint256 public nextTokenId;

  constructor() ERC721("ArtFactory", "ART") {}

  function createArtwork(string memory _name, string memory _url) public onlyOwner returns (uint256) {
    uint256 tokenId = nextTokenId;
    _safeMint(msg.sender, tokenId);
    artworks[tokenId] = Artwork(_name, _url);
    nextTokenId++;
    return tokenId;
  }

  function getArtwork(uint256 _tokenId) public view returns (string memory, string memory) {
    Artwork memory artwork = artworks[_tokenId];
    return (artwork.name, artwork.url);
  }

}
