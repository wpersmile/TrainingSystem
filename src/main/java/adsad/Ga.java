package adsad;

import com.wper.model.Video;
import com.wper.service.Impl.*;

public class Ga {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		UserServiceImpl userService=new UserServiceImpl();
		List<User> list=userService.getUser("10010");
		System.out.println(userService.getUser("10010"));
		System.out.println(userService.getUserPass("10010"));
		String s=userService.getUserPass("10010");
		List<User> list1=userService.getUserByPhone("10010");
		System.out.println(list1.get(0).getEmail());
		List<String> list2=new ArrayList<>();
		list2.add("1231");
		list2.add("dasdas");
		System.out.println(list2.get(1));
*/
		/*
		MySubServiceImpl mySubService=new MySubServiceImpl();
		List<MySubject> list=mySubService.getMySubInfo("10010");
		for (MySubject s : list
				) {
			System.out.println(s.getSubName());
		}
		System.out.println(mySubService.getCountSub("18811127360"));
*/
/*		SubServiceImpl subService=new SubServiceImpl();
		List<Subject> list=subService.getAllSub();
		for (Subject s: list
			 ) {
			System.out.println(s.getName());
		}*/
//        FileServiceImpl fileService=new FileServiceImpl();
//        for (Files s: fileService.getAllFile()
//             ) {
//            System.out.println(s.getName());
//        }
      /*FileServiceImpl fileService=new FileServiceImpl();
      fileService.addFile(new Files("大数据指南","url","大数据"));*/
/*	    UserServiceImpl userService=new UserServiceImpl();
	    userService.updatePass(new User("12321","123"));*/
/*FileServiceImpl fileService=new FileServiceImpl();
		for (Files s: fileService.getFile(1)
			 ) {
			System.out.println(s.getName());
		}
	}*/
	/*	File file=new File("C:\\Users\\raind\\Desktop\\23123.txt");
		file.delete();*/
/*		UserServiceImpl userService=new UserServiceImpl();
		List<User> list=userService.getAllUser();
		for (User u:list
			 ) {
			System.out.println(u.getPhone());
		}*/

		VideoServiceImpl videoService=new VideoServiceImpl();

		for (Video v:videoService.getAllVideo()
			 ) {
			System.out.println(v.getId()+v.getName());
		}
}}
