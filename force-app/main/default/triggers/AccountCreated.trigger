trigger AccountCreated on Account (after insert) {
 List<Contact> conList = new List<Contact>();
    for(Account acc : Trigger.new){
        if(acc.AnnualRevenue>=50000){
            contact c= new contact();
            c.FirstName='Smriti ';
            c.LastName ='Saran';
            c.AccountId = acc.Id;
            conList.add(c);
        }
    }
insert conList;    
}