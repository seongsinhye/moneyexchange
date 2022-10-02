package service;


import dao.AlarmDao;
import dto.AlarmCommand;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlarmService {


    private AlarmDao alarmDao;

    public void setAlarmDao(AlarmDao alarmDao) {
        this.alarmDao = alarmDao;
    }

    public void add(AlarmCommand alarmCommand){

        alarmDao.add(alarmCommand);
    }

    public List<AlarmCommand> select(AlarmCommand alarmCommand){
        return alarmDao.select(alarmCommand);
    }


    public void delete(int idx){
        alarmDao.delete(idx);
    }

}