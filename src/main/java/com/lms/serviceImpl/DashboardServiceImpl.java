package com.lms.serviceImpl;

import com.lms.daoImpl.DashboardDaoImpl;
import com.lms.pojo.DashboardStats;
import com.lms.service.DashboardService;
import com.lms.dao.DashboardDao;

public class DashboardServiceImpl implements DashboardService {
	
	private DashboardDao dashboardDao = new DashboardDaoImpl();
	
	public DashboardStats getDashboardStats() {
		DashboardStats stats = dashboardDao.fetchDashboardStats();
		return stats != null ? stats : new DashboardStats();
	}

}
