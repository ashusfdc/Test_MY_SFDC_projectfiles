trigger AcctUpdate on Account (after update) {
    Set<Id> AcctIds = new Set<Id>();
    for(Account a: trigger.new){
        system.debug('City'+a.City__c);
        if(a.City__c!=trigger.oldMap.get(a.Id).City__c){
            AcctIds.add(a.id);
        }
    }
    List<Opportunity> oppor = [Select id,City__c,accountid from Opportunity where accountid In: AcctIds];
    for(Opportunity opp : oppor){
        //opp.City__c = trigger.newmap.get.(opp.Accountid).City__c ;
        opp.City__c = trigger.newMap.get(opp.accountid).City__c;
        system.debug('City'+opp.City__c);
    }
    update oppor;
    
}