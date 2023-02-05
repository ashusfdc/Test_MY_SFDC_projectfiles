trigger AcctTrg on Account (before update) {
    for(Account a : Trigger.New){
        if(a.Phone!= Trigger.oldMap.get(a.Id).phone){
            a.Name= a.Name + a.Phone;
        }
    }
}