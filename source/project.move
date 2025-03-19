module TalentVerify::CredentialVerification {

    use aptos_framework::signer;

    /// Struct representing a credential.
    struct Credential has store, key {
        credential_data: vector<u8>,  // Encrypted or hashed credential data
    }

    /// Function to add a credential to the blockchain.
    public fun add_credential(account: &signer, credential_data: vector<u8>) {
        let credential = Credential { credential_data };
        move_to(account, credential);
    }

    /// Function to verify if a credential exists for a given account.
    public fun verify_credential(account: address): bool {
        return exists<Credential>(account)
    }
}
