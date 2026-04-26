pragma solidity ^0.8.20;

contract DIDRegistry {

    struct Identity {
        address wallet;
        string did;
        uint256 reputation;
        bool active;
    }

    mapping(string => Identity) public identities;

    event DIDRegistered(string did, address wallet);

    function registerDID(string memory did) public {
        require(identities[did].wallet == address(0), "DID exists");

        identities[did] = Identity({
            wallet: msg.sender,
            did: did,
            reputation: 50,
            active: true
        });

        emit DIDRegistered(did, msg.sender);
    }

    function getIdentity(string memory did) public view returns (Identity memory) {
        return identities[did];
    }
}
