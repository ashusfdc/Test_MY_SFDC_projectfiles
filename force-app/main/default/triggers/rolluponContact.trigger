trigger rolluponContact on Contact (after insert,after update,after delete,after undelete){
    if(trigger.isInsert|trigger.isUpdate||trigger.isDelete||trigger.isundelete){
        Countcontact.countcontacts(trigger.new,trigger.old);
    }

}