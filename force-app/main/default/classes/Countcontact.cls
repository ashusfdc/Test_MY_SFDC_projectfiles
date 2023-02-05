public class Countcontact {
    public static void countcontacts(List<Contact> newcontact,List<Contact> oldcontact){
        Set<id> accid = new Set<id>();
        try{
            if(newcontact!=null){
                for(Contact c :newcontact){
                    if(c.accountid !=null){
                        accid.add(c.accountid);
                    }
                }
            }
            if(oldcontact!=null){
                for(Contact c:oldcontact){
                    accid.add(c.Accountid);
                }
            }
            List<Account> acc=[Select id,CountContact__c,(Select id from Contacts)from Account where id in:accid];
            if(acc!=null){
                for(Account accValue:acc){
                    accValue.CountContact__c = accValue.Contacts.size();
                    system.debug('Count contact'+accValue.CountContact__c);
                }
            }
            if(!acc.isEmpty()){
                update acc;
            }
        }
        Catch(exception e){
            System.debug('Get Message'+e.getMessage());
        }
    }

}