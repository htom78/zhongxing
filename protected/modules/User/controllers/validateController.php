<?php

class ValidateController extends Controller
{
    private $_user;
    private $_model;
    /**
     * init 
     */
    public function init()
    {
        $this->_user = Yii::app()->user;
        $this->loadModel($this->_user->id);
        //$this->_model= User::model();
        //init css and javascript
        $cs = Yii::app()->clientScript;
        $cs->registerCssFile(Yii::app()->baseUrl . '/css/user.css');
        $cs->registerCssFile(Yii::app()->baseUrl . '/css/user_new.css');
        $cs->registerCssFile(Yii::app()->baseUrl . '/css/index.css');
        $cs->registerCssFile(Yii::app()->baseUrl . '/css/main_user.css');
        $cs->registerCssFile(Yii::app()->baseUrl . '/css/css.css');
        //Yii::app()->clientScript->registerCssFile(Yii::app()->baseUrl.'/css/validate/user.css');
    }
    //实名认证
    public function actionAvatar()
    {
        //$model = $this->loadModel($this->_user->id);
        $this->render('avatar',array('model'=>$this->_model));
    }
    //validate emsil
    public function actionEmail()
    {
        $this->render('email',array('model'=>$this->_model));
    }
    //validate phone
    public function actionPhone()
    {
        $this->render('phone',array('model'=>$this->_model));
    }
    
    
	public function actionIndex()
	{
	  // print_r($this->_userid);
       //exit();
	   //默认进入验证页面
		$this->render('index');
	}
    //vip
    public function actionVip()
    {
        $this->render('vip',array('model'=>$this->_model));
    }
    //return $model  = user::mode();
    private function loadModel($id)
    {
        $model = User::model()->findByPk($id);
        if($model == null)
            throw new CHttpException('400','您查找的页面不存在');
        $this->_model = $model;
        
    }

	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
}