public with sharing class lch_ActiveContactController {
    
    public static List<Contact> getActiveContacts(Id accountId){
        return [SELECT Id, Active__c, FirstName, LastName, AccountId, Title, Phone, Email, MobilePhone, OwnerId FROM Contact WHERE Active__c = true AND AccountId = :accountId];
    }
}