trigger AccntWithCont on Account (after insert) {
    List<Contact> cntList = new List<Contact>();
    for(Account a : Trigger.New){
        Contact c = new Contact();
        c.AccountId = a.id;
        c.LastName = a.Name;
        c.phone = a.Phone;
        cntList.add(c);        
    }
    insert cntList;

}