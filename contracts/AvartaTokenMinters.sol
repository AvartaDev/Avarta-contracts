pragma solidity ^0.7.0;
import {Ownable} from "./libs/Ownable.sol";

contract AvartaTokenMinters is Ownable {
    mapping(address => bool) public minters;

    modifier onlyMinter() {
        bool hasAccess = minters[msg.sender];
        require(
            hasAccess == true,
            "mint access has not been granted to this account"
        );
        _;
    }

    function grantAccess(address minter) public onlyOwner {
        bool hasAccess = minters[minter];

        require(hasAccess == false, "minter has already been granted access");
        minters[minter] = true;
    }

    function revokeAccess(address minter) public onlyOwner {
        bool hasAccess = minters[minter];

        require(hasAccess == true, "minter has not been granted access");
        minters[minter] = false;
    }
}