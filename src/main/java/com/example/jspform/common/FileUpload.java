package com.example.jspform.common;

import com.example.jspform.bean.BoardVO;
import com.example.jspform.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request){
          String filename = "";
          int sizeLimit = 15 * 1024 * 1024; // 한번에 올릴 수 있는 파일 용량 : 15M로 제한

          String realPath = request.getServletContext().getRealPath("upload");
          System.out.println(realPath);

          //upload 폴더가 없는 경우 폴더를 만들어라
          File dir = new File(realPath);
          if (!dir.exists()) dir.mkdirs();

          BoardVO one = null;
          MultipartRequest multpartRequest = null;
          try{
              multpartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8",new DefaultFileRenamePolicy());
              filename = multpartRequest.getFilesystemName("photo");

              one = new BoardVO();
              String sid = multpartRequest.getParameter("id");
              if(sid!=null&&!sid.equals("")) one.setId(Integer.parseInt(sid));
              one.setFirstName(multpartRequest.getParameter("firstName"));
              one.setLastName(multpartRequest.getParameter("lastName"));
              one.setBirthday(multpartRequest.getParameter("birthday"));
              one.setGender(multpartRequest.getParameter("gender"));
              one.setEmail(multpartRequest.getParameter("email"));
              one.setPhone(multpartRequest.getParameter("phone"));
              one.setInformation(multpartRequest.getParameter("information"));
              one.setUserType(multpartRequest.getParameter("userType"));
              one.setAccount(multpartRequest.getParameter("account"));

              if (sid!=null && !sid.equals("")){  //edit인 경우 기존 파일이름과 비교
                  BoardDAO dao = new BoardDAO();
                  String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                  if(filename!=null && oldfilename!=null) //새로 덮어씌울 파일이 있으면 이전 파일 제거
                      FileUpload.deleteFile(request, oldfilename);
                  else if(filename==null && oldfilename !=null) //새로운 파일 없는 경우 이전 파일 유지
                      filename = oldfilename;
                  //else filename="./assets/images/defaultImage.png";
              }

              one.setPhoto(filename);
          } catch (IOException e) {
              throw new RuntimeException(e);
          }
          return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }



}
