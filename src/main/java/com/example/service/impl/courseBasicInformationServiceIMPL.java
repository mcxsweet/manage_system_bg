package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.courseBasicInformationMAPPER;
import com.example.object.courseBasicInformation;
import com.example.service.courseBasicInformationSERVICE;
import org.springframework.stereotype.Service;

@Service
public class courseBasicInformationServiceIMPL extends ServiceImpl<courseBasicInformationMAPPER, courseBasicInformation> implements courseBasicInformationSERVICE {
}
