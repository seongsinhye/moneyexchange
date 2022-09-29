package service;


import dao.AlarmDao;
import dto.AlarmCommand;
import org.springframework.stereotype.Service;

@Service
public class AlarmService {


    private AlarmDao alarmDao;

    public void setAlarmDao(AlarmDao alarmDao) {
        this.alarmDao = alarmDao;
    }

    public void add(AlarmCommand alarmCommand){

        alarmDao.add(alarmCommand);
    }



}