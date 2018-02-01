package com.yang.ocrs.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public  class Dao extends HibernateDaoSupport {
	
	public <T> T getById(Class<T> clazz,Integer id) {
		return getHibernateTemplate().get(clazz,id);
	}
	public Integer save (Object obj){
		return (Integer)getHibernateTemplate().save(obj);
	}
	
	public void update(Object obj){
		getHibernateTemplate().update(obj);
	}
	
	public void delete(Object obj) {
		getHibernateTemplate().delete(obj);
	}
	
	
	public boolean isExsiting(Object obj) {
		List objList=getHibernateTemplate().findByExample(obj);
		return objList.size()>0;
	}
	
	public List findByQuery(String query,Object... values) {
		return getHibernateTemplate().find(query, values);
	}
	
	public <T> List<T> findAll(Class<T> entityClass){
		return getHibernateTemplate().loadAll(entityClass);
	}
}
