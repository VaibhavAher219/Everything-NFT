// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract vabnft is ERC721,ERC721URIStorage{

    mapping (address=>bool ) whitelist;
    address public owner;
    
    constructor() ERC721("VABNFT","VFT"){
        owner=msg.sender;
    }
    function mint(address to,uint tokenId ,string memory uri) public payable {
        require(msg.value==0.001 ether);
        _safeMint(to, tokenId, "");
        _setTokenURI(tokenId,uri);

    }
    function whitelistmint(address to,uint tokenId,string memory uri) public {
        require(whitelist[to]==true);
        _safeMint(to, tokenId, "");
        _setTokenURI(tokenId,uri);
    }
    function setwhitelist(address[] memory users) public {
        require(msg.sender==owner);
        for (uint i=0;i<users.length;i++){
            whitelist[users[i]]=true;
        }
    }
     function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }
   function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
   
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }



}