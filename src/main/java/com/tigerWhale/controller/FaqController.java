package com.tigerWhale.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tigerWhale.command.FaqVO;
import com.tigerWhale.faq.service.FaqService;
import com.tigerWhale.util.FaqCriteria;
import com.tigerWhale.util.PageVO;

@Controller
@RequestMapping("/faqBoard")
public class FaqController 
{
	
	@Autowired
	@Qualifier("faqService")
	private FaqService faqService;
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws Exception {
		
		System.out.println("######################");
		
	
		//변환할 파일명의 사용될 UUID 생성
		UUID uuid = UUID.randomUUID();
		//확장자
		String fileType = multiFile.getFile("upload").getContentType().split("/")[1];
		//원본파일명
//		String originFileName = multiFile.getFile("upload").getOriginalFilename().substring(0, fileType.length() - 2);
		//변환파일명
		String changeFileName = uuid.toString();
		//파일 사이즈
		String fileSize = Long.toString(multiFile.getFile("upload").getSize());
		
//		System.out.println("원본파일명 >> " + originFileName);
		System.out.println("변환파일명 >> " + changeFileName);
		System.out.println("파일사이즈 >> " + fileSize);
		System.out.println("파일확장자 >> " + fileType);
		
		List<MultipartFile> fileList = multiFile.getFiles("upload");
//        String src = multiFile.getParameter("src");
//        System.out.println("src value : " + src);

        String path = "C:\\image\\";

        for (MultipartFile mf : fileList) {
            String oriFileName = mf.getOriginalFilename(); // 원본 파일 명
            long oriFileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + oriFileName);
            System.out.println("fileSize : " + oriFileSize);

            String safeFile = path + uuid + '.' + fileType;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            
            
        }


		OutputStream out = null;
		PrintWriter printWriter = null;

		//인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
//		File safeFile = (File) multiFile.getFile("upload");
//		multiFile.getFile("upload").transferTo(safeFile);

		try {

			// 파일 이름 가져오기
//			String fileName = upload.getOriginalFilename();
//			byte[] bytes = upload.getBytes();

				//이미지 경로 생성
//			String path = "C:\\app";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
//			String ckUploadPath = path + changeFileName + "." + fileType;
//			File folder = new File(path);

			//해당 디렉토리 확인
//			if (!folder.exists()) {
//				try {
//					folder.mkdirs(); // 폴더 생성
//				} catch (Exception e) {
//					e.getStackTrace();
//				}
//			}

//			out = new FileOutputStream(new File(ckUploadPath));
			//out.write(fileSize);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

//			String callback = request.getParameter("CKEditorFuncNum");
//			printWriter = response.getWriter();
//			String fileUrl = "C:\\app?uid=" + changeFileName + "&fileName=" + fileName; // 작성화면
				// 업로드시 메시지 출력
//			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "C:\\image\\16272843346482.png";
	}
	
	
	
	
	
	
	
	

	//답변등록하기
	@RequestMapping("/replyForm")
	public String replyForm(FaqVO faqVo, RedirectAttributes RA) {
		
		
		System.out.println("toString  >>>>> " + faqVo.toString());
		System.out.println("getReply  >>>>> " + faqVo.getReply());
		
		
		int result = faqService.replyForm(faqVo); //성공시 1반환, 실패시 0
		RA.addAttribute("bno",faqVo.getBno());
		
		
		return "redirect:/faqBoard/faqDetail"; //포워딩
	}
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value = "/upload", method = RequestMethod.POST)
//	public String imageUpload1(HttpServletRequest request, HttpServletResponse response,
//			MultipartHttpServletRequest multiFile) throws Exception {
//		
//		System.out.println("######################");
//		
//	
//		//변환할 파일명의 사용될 UUID 생성
//		UUID uuid = UUID.randomUUID();
//		//확장자
//		String fileType = multiFile.getFile("upload").getContentType().split("/")[1];
//		//원본파일명
////		String originFileName = multiFile.getFile("upload").getOriginalFilename().substring(0, fileType.length() - 2);
//		//변환파일명
//		String changeFileName = uuid.toString();
//		//파일 사이즈
//		String fileSize = Long.toString(multiFile.getFile("upload").getSize());
//		
////		System.out.println("원본파일명 >> " + originFileName);
//		System.out.println("변환파일명 >> " + changeFileName);
//		System.out.println("파일사이즈 >> " + fileSize);
//		System.out.println("파일확장자 >> " + fileType);
//		
//		List<MultipartFile> fileList = multiFile.getFiles("upload");
////        String src = multiFile.getParameter("src");
////        System.out.println("src value : " + src);
//
//        String path = "C:\\image\\";
//
//        for (MultipartFile mf : fileList) {
//            String oriFileName = mf.getOriginalFilename(); // 원본 파일 명
//            long oriFileSize = mf.getSize(); // 파일 사이즈
//
//            System.out.println("originFileName : " + oriFileName);
//            System.out.println("fileSize : " + oriFileSize);
//
//            String safeFile = path + uuid + '.' + fileType;
//            try {
//                mf.transferTo(new File(safeFile));
//            } catch (IllegalStateException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            } catch (IOException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//            
//            
//        }


//		OutputStream out = null;
//		PrintWriter printWriter = null;
//
//		//인코딩
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=utf-8");
		
		
//		File safeFile = (File) multiFile.getFile("upload");
//		multiFile.getFile("upload").transferTo(safeFile);

//		try {

			// 파일 이름 가져오기
//			String fileName = upload.getOriginalFilename();
//			byte[] bytes = upload.getBytes();

				//이미지 경로 생성
//			String path = "C:\\app";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
//			String ckUploadPath = path + changeFileName + "." + fileType;
//			File folder = new File(path);

			//해당 디렉토리 확인
//			if (!folder.exists()) {
//				try {
//					folder.mkdirs(); // 폴더 생성
//				} catch (Exception e) {
//					e.getStackTrace();
//				}
//			}

//			out = new FileOutputStream(new File(ckUploadPath));
			//out.write(fileSize);
//			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

//			String callback = request.getParameter("CKEditorFuncNum");
//			printWriter = response.getWriter();
//			String fileUrl = "C:\\app?uid=" + changeFileName + "&fileName=" + fileName; // 작성화면
				// 업로드시 메시지 출력
//			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
//			printWriter.flush();

//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (out != null) {
//					out.close();
//				}
//				if (printWriter != null) {
//					printWriter.close();
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return "C:\\image\\16272843346482.png";
//	}
	
	
	
	
	
	@RequestMapping("/faqList")
	public String faqList(Model model, FaqCriteria cri)
	{
		
		ArrayList<FaqVO> list = faqService.getList(cri);
		int total = faqService.getTotal(cri);
		PageVO pageVO = new PageVO(cri, total); //(기준, 토탈)
		
		model.addAttribute("pageVO", pageVO); //페이지네이션전달		
		model.addAttribute("list", list); //게시글전달
		
		return "faqBoard/faqList";
	}

	//등록화면
	@RequestMapping("/faqRegist")
	public String faqRegist() {
		return "faqBoard/faqRegist";
	}
	
	
	//상세화면과 변경화면은 내용이 동일하기 때문에 하나로 묶어서 사용
	@RequestMapping({"/faqDetail", "/faqModify"})
	public void getDetail(@RequestParam("bno") int bno, 
						  Model model) {
		
		FaqVO boardVO = faqService.getDetail(bno);
		model.addAttribute("boardVO", boardVO);
		
	}
	
	//등록요청
	@RequestMapping("/registForm")
	public String registForm(FaqVO vo, RedirectAttributes RA) {
		
		
		int result = faqService.regist(vo); //성공시 1반환, 실패시 0
		
		if(result == 1) {
			RA.addFlashAttribute("msg", "등록 처리 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "등록에 실패했습니다. 다시 시도하세요");
		}
		
		
		return "redirect:/faqBoard/faqList"; //다시컨트롤러를 태움
	}
	
	//글 업데이트 처리
	@RequestMapping("/faqUpdate")
	public String faqUpdate(FaqVO vo,
							 RedirectAttributes RA) {
		
		int result = faqService.update(vo);
		
		if(result == 1) {
			RA.addFlashAttribute("msg", "정상 수정되었습니다");
		} else {
			RA.addFlashAttribute("msg", "수정에 실패했습니다. 다시 시도 하세요");
		}
		
		return "redirect:/faqBoard/faqList";
	}
	
	//글 삭제
	@RequestMapping("/faqDelete")
	public String faqDelete(@RequestParam("bno") int bno,
							 RedirectAttributes RA) {
		
		
		int result = faqService.delete(bno);
		
		if(result == 1) {
			RA.addFlashAttribute("msg", "삭제 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "삭제에 실패했습니다. 다시 시도 하세요");
		}
		
		
		return "redirect:/faqBoard/faqList";
	}
	
	
	
	/*
	 * @RequestMapping("/faqDetail") public String faqDetail() {
	 * System.out.println("===================================");
	 * 
	 * return "faqBoard/faqDetail";
	 * 
	 * }
	 * 
	 * 
	 * @RequestMapping("/faqRegist") public String faqRegist() { return
	 * "faqBoard/faqRegist"; }
	 * 
	 * @RequestMapping("/faqModify") public String faqUpdate() { return
	 * "faqBoard/faqModify"; }
	 */
}

