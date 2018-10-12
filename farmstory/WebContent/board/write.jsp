<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<jsp:include page="./aside/aside_${gr}.jsp" />
<div id="board">
	<h3>글쓰기</h3>
	<div class="write">
		<form action="/jboard2/write.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="cate" value="free" /> <input type="hidden"
				name="uid" value="${member.uid }" />
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" placeholder="제목을 입력하세요."
						required /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="20" required></textarea></td>
				</tr>
				<tr>
					<td>첨부</td>
					<td><input type="file" name="file" /></td>
				</tr>
			</table>
			<div class="btns">
				<a href="/jboard2/list.do" class="cancel">취소</a> <input
					type="submit" class="submit" value="작성완료" />
			</div>
		</form>
	</div>
</div>
<!-- 컨텐츠 내용 끝 -->
</article>
</section>
</section>
<%@ include file="../tail.jsp"%>

