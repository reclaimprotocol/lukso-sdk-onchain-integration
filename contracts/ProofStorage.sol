// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC725Y} from "@erc725/smart-contracts/contracts/ERC725Y.sol";


/**
 * @title ProofStorage
 * @dev A contract that stores proofs, which are key-value pairs of claim identifiers and proof data.
 *      This contract inherits from ERC725Y to leverage its key-value store functionalities.
 */
contract ProofStorage is ERC725Y {

    // Address of the Reclaim contract that is authorized to store proofs.
    address public Reclaim;

    /**
     * @dev Initializes the contract setting the owner of the ERC725Y key-value store.
     * @param newOwner The address of the new owner of the contract.
     */
    constructor(address newOwner) ERC725Y(newOwner) {}

    // Event emitted when a proof is stored.
    event ProofStored(bytes32 indexed claimIdentifier, bytes data);

    /**
     * @dev Stores a proof in the contract.
     *      This function can be called by external contracts or addresses.
     * @param claimIdentifier The unique identifier for the claim.
     * @param data The proof data to be stored.
     */
    function storeProof(bytes32 claimIdentifier, bytes memory data) external {
        // Store the proof
        setData(claimIdentifier, data);

        // Emit the ProofStored event to log the storage operation
        emit ProofStored(claimIdentifier, data);
    }


    /**
     * @dev Retrieves a stored proof by its claim identifier.
     * @param claimIdentifier The unique identifier for the claim.
     * @return singature The proof signature associated with the given claim identifier.
     */
    function getSignature(bytes32 claimIdentifier) external view returns (bytes memory singature) {
        // Return the proof signature corresponding to the claim identifier
        singature = getData(claimIdentifier);
    }
}
