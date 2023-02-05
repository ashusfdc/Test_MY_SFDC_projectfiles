trigger AccPhoneCheck on Account (after update) {
    Set<ID> Accid = new Set<Id>();
    for(Account acc:Trigger.new){
        Accid.add(acc.Id);        
    }
    List<Contact> conList = [Select id,otherphone,homephone from contact where AccountId in:Accid];
    system.debug('Unmodified'+conList);
    List<Contact> updateConlist = new List<Contact>();
      for(Account acc:Trigger.new){
        if(!conList.isEmpty()){
            for(Contact con: conList){
                con.otherphone= trigger.oldMap.get(acc.Id).phone;
                con.HomePhone= trigger.newMap.get(acc.Id).phone;
                updateConlist.add(con);
                system.debug('Unmodified'+updateConlist);
            }
        }
        update updateConlist;
    }
    
}