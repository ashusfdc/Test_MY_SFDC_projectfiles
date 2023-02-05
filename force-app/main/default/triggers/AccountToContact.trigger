trigger AccountToContact on Account (before delete) {
    Set<Id> accId = new Set<Id>();
    Map<Id,Account> mapAcc = new Map<Id,Account>();
    for(Account acc:Trigger.old){
        accId.add(acc.id);
    }
    for(Account acc:[select id,name,(select id,firstname,lastname from Contacts)from Account where id in:accId]){
        mapAcc.put(acc.id,acc);
    }
    for(Account al: trigger.old){
        if(mapAcc.get(al.Id).Contacts.size()>2){
            al.addError('Account can not be deleted as Conact>2');
          
        }
    }
}