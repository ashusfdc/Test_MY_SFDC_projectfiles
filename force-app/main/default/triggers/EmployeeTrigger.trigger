trigger EmployeeTrigger on Employee__c (before delete,after delete) {
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            EmployeeTriggerHandler.checkEmployeeStatus(Trigger.Old);
        }else if(Trigger.isAfter){
            EmployeeTriggerHandler.updateLeftEmpCountOnAcc(Trigger.Old);
        }
        
    }

}