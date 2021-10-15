package com.yhj3211.investment.post;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yhj3211.investment.post.bo.HopeBO;
import com.yhj3211.investment.post.bo.LikeBO;
import com.yhj3211.investment.post.bo.PostBO;
import com.yhj3211.investment.post.comment.bo.CommentBO;
import com.yhj3211.investment.post.comment.model.Comment;
import com.yhj3211.investment.post.comment.model.PostWithComments;
import com.yhj3211.investment.post.model.Hope;
import com.yhj3211.investment.post.model.Post;
import com.yhj3211.investment.user.bo.UserBO;


@RequestMapping("/post")
@Controller
public class PostController {

	@Autowired
	private HopeBO hopeBO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	//전체목록
		@GetMapping("/postlist")
		public String postListView(HttpServletRequest request,
									Model model,
									@RequestParam(value="search", required=false) String search,
									@RequestParam(value="keyword", required=false) String keyword) {
			
			HttpSession session = request.getSession();
			int userId = (Integer)session.getAttribute("userId");
			
			List<PostWithComments> postList = postBO.getPostList(userId, search, keyword);
			
			model.addAttribute("postList", postList);
			return "/investment/post/postlist";
		}
		
		
	//포스트 상세화면
		@GetMapping("/detail_post")
		public String detailView(@RequestParam("id") int id,
									HttpServletRequest request,
									Model model) {

			Post post = postBO.getDetailPost(id);
			List<Comment> CommentList = commentBO.getCommentList(id);
			int likeCount = likeBO.getLikeCount(post.getId());
			
			model.addAttribute("likeCount", likeCount);
			model.addAttribute("post", post);
			model.addAttribute("commentList", CommentList);
			
			return "investment/post/Post";
			
		}

	//글 작성 페이지
		@GetMapping("/create_Post")
		public String createPost() {
			return "/investment/post/createpost";
		}
		
	//글 수정 페이지
		@GetMapping("/adjust_Post")
		public String adjustPost(@RequestParam("id") int id,
									Model model){
			
			Post post = postBO.getDetailPost(id);
			model.addAttribute("post", post);
			
			
			return "/investment/post/adjustPost";
		}
		
		
		@GetMapping("/test")
		public String test() {
			return "/investment/post/test";
		}
		
	//메인 페이지
		@GetMapping("/main")
		public String main(Model model) {
			
			List<Hope> hopeList = hopeBO.selectHopeList();
			model.addAttribute(hopeList);
			
			return "investment/post/main";
		}
		
}
