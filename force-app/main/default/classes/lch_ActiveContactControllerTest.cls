@isTest
private class lch_ActiveContactControllerTest {


    @isTest
    static void testGetActiveContacts() {
        // Create an account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create active and inactive contacts for the same account
        Contact activeContact1 = new Contact(
            FirstName = 'Jane',
            LastName = 'Doe',
            AccountId = testAccount.Id,
            Active__c = true,
            Email = 'jane@example.com'
        );
        
        Contact activeContact2 = new Contact(
            FirstName = 'John',
            LastName = 'Smith',
            AccountId = testAccount.Id,
            Active__c = true,
            Email = 'john@example.com'
        );
        
        Contact inactiveContact = new Contact(
            FirstName = 'Inactive',
            LastName = 'User',
            AccountId = testAccount.Id,
            Active__c = false,
            Email = 'inactive@example.com'
        );

        insert new List<Contact>{activeContact1, activeContact2, inactiveContact};

        // Call the method
        List<Contact> activeContacts = lch_ActiveContactController.getActiveContacts(testAccount.Id);

        // Assertions
        System.assertEquals(2, activeContacts.size(), 'Only active contacts should be returned');
        for (Contact c : activeContacts) {
            System.assertEquals(true, c.Active__c, 'Returned contact should be active');
            System.assertEquals(testAccount.Id, c.AccountId, 'Returned contact should belong to the test account');
        }
    }
}