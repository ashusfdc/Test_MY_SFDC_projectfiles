trigger AccTrigger on Account (before delete) {
    for(Account a : Trigger.old){
        a.addError('You do not have permission to delete this account.Please contact your System Admin');
    }
}