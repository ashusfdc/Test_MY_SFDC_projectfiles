public class EmployeeTriggerHandler {
    public static void checkEmployeeStatus(List<Employee__c> oldList){
        for(Employee__c emp : oldList){
            if(emp.Active__c == true){
                emp.addError('Active field cannot be deleted');
            }
        }
    }
    public static void updateLeftEmpCountOnAcc(List<Employee__c> oldList){
        Set<Id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        Map<Id,Account> accIdToAccMap;
        List<Employee__c> empList = new List<Employee__c>();
        Map<Id,Decimal> accIdToTotalCount = new Map<Id,Decimal>();
        for(Employee__c emp : oldList){
            if(emp.Account__c!=null){
                accIds.add(emp.Account__c);
                empList.add(emp);                    
            }
        }
        if(!accIds.isEmpty()){
            accIdToAccMap = new Map<Id,Account>([Select Id , Left_Employee_Count__c From Account Where Id IN:accIds]);
        }
        if(!empList.isEmpty()){
            for(Employee__c emp : empList){
                if(accIdToAccMap.containsKey(emp.Account__c)){
                    Decimal count = accIdToTotalCount.get(emp.Account__c) + 1;
                    accIdToTotalCount.put(emp.Account__c,count);
                }else {
                    accIdToTotalCount.put(emp.Account__c,accIdToAccMap.get(emp.Account__c).Left_Employee_Count__c+1);
                }
            }
        }
        
        for(Id accId : accIdToTotalCount.keySet()){
            Account acc = new Account();
            acc.id = accId;
            acc.Left_Employee_Count__c = accIdToTotalCount.get(accId);
            accToBeUpdated.add(acc);
        }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        } 
    }
}