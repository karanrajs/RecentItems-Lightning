/**
* This apex class to return the recently viewed records of particular object
* 
* @Author  Karanraj Sankaranarayanan 
* @version 1.0
* @since   2015-10-12
*/ 

public class RecentRecordsController {
    /**
     * This method is used to return recently view records
     * @param ObjectName - Specify the API name of object to get recently view records
     * @param limits - Number of records need to return
     * @param fieldstoget - Fields from the object need to get
     */ 
    @AuraEnabled public static List<sobject> getRecentRecords(String ObjectName,String limits,String fieldstoget){     
        
        List<Id> recentlyViewedIds = new List<Id>();
        Integer limitofRecord = Integer.valueOf(String.escapeSingleQuotes(limits));
        for(sObject obj : [Select Id from RecentlyViewed where Type =:String.escapeSingleQuotes(ObjectName)]){
            recentlyViewedIds.add(obj.Id);
        }
        String queryString = 'Select '+ String.escapeSingleQuotes(fieldsToGet)+
                             ' from '+ String.escapeSingleQuotes(ObjectName) +
                             ' where ID IN:recentlyViewedIds Limit '+ limitofRecord;
      
        return database.query(queryString);
    }
}