<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/github-markdown.css">
<style>
	.markdown-body {
		box-sizing: border-box;
		min-width: 200px;
		max-width: 980px;
		margin: 0 auto;
		padding-top: 10px;
	}
</style>
<div class="markdown-body">
<h1>
<a aria-hidden="true" class="anchor" href="#%EB%93%A4%EC%96%B4%EA%B0%80%EB%A9%B0" id="user-content-들어가며"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>들어가며</h1>
<hr/>
파이썬에서는 다양한 기능을 제공하는 패키지들이 많다. 그 중 Pillow라는 패키지는 이미지 파일을 다루는 것을 쉽게 만들어 주며, 이미지 파일을 수정하거나, 비트 파일을 수정하며 드러나지 않게 메시지를 숨길 수도 있다. 이번에는 이 패키지를 이용하여 어떻게 비밀메시지를 이미지 파일 속에 숨기며, 확인 할 수 있는지 알아보도록 하겠다.
<br/>
<br/>
<ul>
<li>
<a href="#%EB%93%A4%EC%96%B4%EA%B0%80%EB%A9%B0">들어가며</a>
<ul>
<li>
<a href="#%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%88%A8%EA%B8%B0%EA%B8%B0">메시지 숨기기</a>
<ul>
<li><a href="#%EC%9C%A0%EB%8B%88%EC%BD%94%EB%93%9C-%EB%A9%94%EC%8B%9C%EC%A7%80%EB%A5%BC-%EB%B9%84%ED%8A%B8%EC%9D%98-%EC%8B%9C%ED%80%80%EC%8A%A4%EB%A1%9C-%EB%A7%8C%EB%93%A4%EA%B8%B0">유니코드 메시지를 비트의 시퀀스로 만들기</a></li>
<li><a href="#%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%9D%B8%EC%BD%94%EB%94%A9">메시지 인코딩</a></li>
<li><a href="#%EC%9D%B4%EB%AF%B8%EC%A7%80-%EB%B3%80%EA%B2%BD%ED%95%98%EA%B8%B0">이미지 변경하기</a></li>
</ul>
</li>
<li>
<a href="#%EB%A9%94%EC%8B%9C%EC%A7%80-%EB%94%94%EC%BD%94%EB%94%A9">메시지 디코딩</a>
<ul>
<li><a href="#%EC%9D%B4%EB%AF%B8%EC%A7%80%EC%9D%98-%EC%A0%81%EC%83%89-%EC%B1%84%EB%84%90%EC%97%90%EC%84%9C-%EB%B9%84%ED%8A%B8%EB%93%A4%EC%9D%84-%EB%BD%91%EC%95%84%EC%98%A4%EB%8A%94-%EC%B6%94%EC%B6%9C%EA%B8%B0-%ED%95%A8%EC%88%98">이미지의 적색 채널에서 비트들을 뽑아오는 추출기 함수</a></li>
<li><a href="#%EB%B9%84%ED%8A%B8-%EA%B0%92%EC%9D%84-%EB%B0%94%EC%9D%B4%ED%8A%B8%EB%A1%9C-%EB%B0%94%EA%BE%B8%EC%96%B4-%EC%A3%BC%EB%8A%94-%ED%95%A8%EC%88%98%EB%93%A4">비트 값을 바이트로 바꾸어 주는 함수들</a></li>
<li><a href="#%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%96%BB%EA%B8%B0">메시지 얻기</a></li>
</ul>
</li>
</ul>
</li>
</ul>
<br/>
<br/>
<blockquote>
<p><a href="https://ko.wikipedia.org/wiki/%EC%8A%A4%ED%85%8C%EA%B0%80%EB%85%B8%EA%B7%B8%EB%9E%98%ED%94%BC" rel="nofollow">스테가노그래피</a></p>
<p>스테가노그래피는 데이터 은폐 기술 중 하나이며, 데이터를 다른 데이터에 삽입하는 기술 혹은 그 연구를 가리킨다.</p>
</blockquote>
<div class="highlight highlight-source-python"><pre><span class="pl-k">from</span> <span class="pl-c1">PIL</span> <span class="pl-k">import</span> Image
<span class="pl-k">import</span> urllib.request
<span class="pl-k">from</span> zipfile <span class="pl-k">import</span> ZipFile
<span class="pl-k">import</span> hmac
<span class="pl-k">import</span> os</pre></div>
<div class="highlight highlight-source-python"><pre>image_source <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">"</span>https://cdn.pixabay.com/photo/2018/01/21/19/57/tree-3097419_1280.jpg<span class="pl-pds">"</span></span>
image <span class="pl-k">=</span> Image.open(urllib.request.urlopen(image_source))</pre></div>
<ul>
<li>다음과 같이 인터넷 상의 url 주소를 가지고 이미지 파일을 불러올 수 있다.</li>
</ul>
<div class="highlight highlight-source-python"><pre>image</pre></div>
<p><img alt="output_5_0" data-canonical-src="https://i.imgur.com/fDMfgKH.jpg" src="https://camo.githubusercontent.com/7d50dcaeaf4298ec0284d5f35363e8982022d440/68747470733a2f2f692e696d6775722e636f6d2f66444d66674b482e6a7067"/></p>
<p>본격적으로 이미지를 수정하기 전에 이미지 파일의 정보를 한번 살펴 보도록 하겠다.</p>
<div class="highlight highlight-source-python"><pre><span class="pl-c"><span class="pl-c">#</span>exif(교환가능 이미지 파일 형식) 키 확인</span>
<span class="pl-k">import</span> <span class="pl-c1">PIL</span>.ExifTags
<span class="pl-k">try</span>:
    <span class="pl-k">for</span> key, value <span class="pl-k">in</span> image._getexif().items():
        <span class="pl-c1">print</span>(<span class="pl-c1">PIL</span>.ExifTags.<span class="pl-c1">TAGS</span>[key], value)
<span class="pl-k">except</span>:
    <span class="pl-c1">print</span>(<span class="pl-s"><span class="pl-pds">"</span>파일정보가 없습니다.<span class="pl-pds">"</span></span>)</pre></div>
<pre><code>Model ILCE-7
ExifOffset 82
ExposureTime (1, 20)
Make SONY
DateTimeOriginal 2016:01:01 13:31:23
FocalLength (200, 10)
LensModel DT 0mm F0 SAM
ISOSpeedRatings (100, 0)
Flash (16, 0)
FNumber (8, 1)
</code></pre>
<p>다음과 같이 카메라 모델, 찍은 날짜, 렌즈 등 여러가지 정보를 살펴볼 수 있다. 만약, GPS 데이터를 제공할 수 있는 카메라로 찍은 사진이라면 EXIF에 추가 정보가 들어 있을 것이다.</p>
<h2>
<a aria-hidden="true" class="anchor" href="#%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%88%A8%EA%B8%B0%EA%B8%B0" id="user-content-메시지-숨기기"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>메시지 숨기기</h2>
<hr/>
<br/>
 이미지 파일에 메시지를 숨기는 방법은 여러가지가 있다. 여기서는 이미지 픽셀의 값 rgb에서 적색채널의 비트를 수정하여 비밀 메시지를 이미지 파일에 숨기도록 할 것이다.
<ul>
<li>이미지 픽셀 얻기 : (x, y) 튜플을 이용해서 해당 좌표 값의 이미지 픽셀을 볼 수 있다.</li>
</ul>
<div class="highlight highlight-source-python"><pre>y <span class="pl-k">=</span> <span class="pl-c1">0</span>
<span class="pl-k">for</span> x <span class="pl-k">in</span> <span class="pl-c1">range</span>(<span class="pl-c1">5</span>):
    <span class="pl-c1">print</span>(image.getpixel((x,y)))</pre></div>
<pre><code>(55, 47, 68)
(17, 13, 27)
(53, 51, 56)
(50, 51, 46)
(72, 75, 66)
</code></pre>
<ul>
<li>어떤 색의 채널인지 확인하기 : 다음과 같이 이미지의 픽셀은 RGB 속성을 사용하는 것을 알 수 있다.</li>
</ul>
<div class="highlight highlight-source-python"><pre>image.getbands()</pre></div>
<pre><code>('R', 'G', 'B')
</code></pre>
<h3>
<a aria-hidden="true" class="anchor" href="#%EC%9C%A0%EB%8B%88%EC%BD%94%EB%93%9C-%EB%A9%94%EC%8B%9C%EC%A7%80%EB%A5%BC-%EB%B9%84%ED%8A%B8%EC%9D%98-%EC%8B%9C%ED%80%80%EC%8A%A4%EB%A1%9C-%EB%A7%8C%EB%93%A4%EA%B8%B0" id="user-content-유니코드-메시지를-비트의-시퀀스로-만들기"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>유니코드 메시지를 비트의 시퀀스로 만들기</h3>
<p>위에서 보았듯이 이미지 파일은 픽셀에 RGB 바이트 값이 들어있는 파일이다. 때문에 우리가 원하는 메시지를 이미지 파일에 삽입하기 위해서는 메시지를 바이트로 바꾸는 과정이 필요하며, 더 나아가 비트 값으로 변환하여 특별한 해독과정 없이는 메시지가 드러나지 않도록 해야한다.</p>
<div class="highlight highlight-source-python"><pre><span class="pl-c"><span class="pl-c">#</span>어떤 수에서 최하위 8비트 뽑아내기</span>
<span class="pl-k">def</span> <span class="pl-en">to_bits</span>(<span class="pl-smi">v</span>):
    b <span class="pl-k">=</span> []
    <span class="pl-k">for</span> i <span class="pl-k">in</span> <span class="pl-c1">range</span>(<span class="pl-c1">8</span>):
        <span class="pl-c"><span class="pl-c">#</span>비트 연산</span>
        b.append(v <span class="pl-k">&amp;</span> <span class="pl-c1">1</span>)
        <span class="pl-c"><span class="pl-c">#</span>v를 1비트 오른쪽으로 시프트</span>
        v <span class="pl-k">=</span> v<span class="pl-k">&gt;&gt;</span><span class="pl-c1">1</span>
    <span class="pl-c"><span class="pl-c">#</span>거꾸로 되어있는 순서 뒤집어서 8-튜플 객체 만들기</span>
    <span class="pl-k">return</span> <span class="pl-c1">tuple</span>(<span class="pl-c1">reversed</span>(b))</pre></div>
<p>위 함수는 1바이트의 값을 받아서 비트로 변환하는 함수이다.
비트 연산을 통해 각각의 비트 값을 얻어서 튜플의 형태로 저장한다.</p>
<div class="highlight highlight-source-python"><pre><span class="pl-c1">print</span>(to_bits(<span class="pl-c1">255</span>))</pre></div>
<pre><code>(1, 1, 1, 1, 1, 1, 1, 1)
</code></pre>
<p>1바이트의 메모리에서는 최대 255까지의 숫자를 저장할 수 있으므로 255를 입력하면 11111111의 값이 튜플 형태로 나온다</p>
<div class="highlight highlight-source-python"><pre><span class="pl-c"><span class="pl-c">#</span>튜플리스트를 받아서 각 요소를 리턴하는 제너레이터 함수</span>
<span class="pl-k">def</span> <span class="pl-en">bit_sequence</span>(<span class="pl-smi">tuple_list</span>):
    <span class="pl-k">for</span> t8 <span class="pl-k">in</span> tuple_list:
        <span class="pl-k">for</span> b <span class="pl-k">in</span> t8:
            <span class="pl-k">yield</span> b</pre></div>
<p>다음은 8-튜플의 리스트를 받아서 비트의 리스트로 반환하는 제너레이터 함수이다. 제너레이터 함수는 일반 함수와는 달리 값을 메모리에 저장하지 않으므로 처리 속도가 빠르다.</p>
<h3>
<a aria-hidden="true" class="anchor" href="#%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%9D%B8%EC%BD%94%EB%94%A9" id="user-content-메시지-인코딩"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>메시지 인코딩</h3>
<p>위의 함수를 이용해서 임의의 문자열을 비트로 바꿀 수 있다. 이 비트를 통해 메시지를 이미지에 인코딩 할 수 있을 것이다. 하지만 인코딩된 메시지를 디코딩(해독)하는 과정에서 디코딩을 언제 그만 둘 수 있을지 결정할 수 있어야 한다.
여러가지 기법들이 있겠지만, 문자열 맨 앞에 2바이트 크기의 메시지 길이를 넣는 방식을 사용하도록 하겠다. 위와 같은 방식을 통해 최대 256x256 비트 크기(한글의 경우 대략 4000자)의 메시지를 넣을 수 있다.</p>
<div class="highlight highlight-source-python"><pre><span class="pl-c"><span class="pl-c">#</span>삽입할 문자열</span>
message <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">"</span>hello, world<span class="pl-pds">"</span></span>

<span class="pl-c"><span class="pl-c">#</span>바이트로 인코딩(UFT-8 형식)</span>
message_bytes <span class="pl-k">=</span> message.encode(<span class="pl-s"><span class="pl-pds">"</span>UTF-8<span class="pl-pds">"</span></span>)
<span class="pl-c"><span class="pl-c">#</span>비트로 인코딩</span>
bits_list <span class="pl-k">=</span> <span class="pl-c1">list</span>(to_bits(byte) <span class="pl-k">for</span> byte <span class="pl-k">in</span> message_bytes)

<span class="pl-c"><span class="pl-c">#</span>메시지 길이 구하기</span>
len_h, len_l <span class="pl-k">=</span> <span class="pl-c1">divmod</span>(<span class="pl-c1">len</span>(message_bytes), <span class="pl-c1">256</span>)
<span class="pl-c"><span class="pl-c">#</span>비트로 인코딩</span>
size_list <span class="pl-k">=</span> [to_bits(len_h), to_bits(len_l)]

<span class="pl-c"><span class="pl-c">#</span>최종 비트</span>
total_list <span class="pl-k">=</span> size_list <span class="pl-k">+</span> bits_list</pre></div>
<h3>
<a aria-hidden="true" class="anchor" href="#%EC%9D%B4%EB%AF%B8%EC%A7%80-%EB%B3%80%EA%B2%BD%ED%95%98%EA%B8%B0" id="user-content-이미지-변경하기"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>이미지 변경하기</h3>
<div class="highlight highlight-source-python"><pre>width, height <span class="pl-k">=</span> image.size
<span class="pl-k">for</span> idx, bit <span class="pl-k">in</span> <span class="pl-c1">enumerate</span>(bit_sequence(total_list)):
    y, x <span class="pl-k">=</span> <span class="pl-c1">divmod</span>(idx, width)
    r, g, b <span class="pl-k">=</span> image.getpixel((x, y))
    <span class="pl-c"><span class="pl-c">#</span>비트조작 - R값 조작</span>
    r_new <span class="pl-k">=</span> (r <span class="pl-k">&amp;</span> <span class="pl-c1"><span class="pl-k">0x</span>fe</span>) <span class="pl-k">|</span> bit
    image.putpixel((x,y), (r_new, g, b))</pre></div>
<ul>
<li>이미지 저장
<ul>
<li>이미지를 저장할 때, jpeg형식은 파일을 압축하면서 데이터 손실이 발생할 수 있기 때문에 tiff확장자로 저장한다.</li>
</ul>
</li>
</ul>
<div class="highlight highlight-source-python"><pre>image.save(<span class="pl-s"><span class="pl-pds">"</span>image.tiff<span class="pl-pds">"</span></span>)</pre></div>
<h2>
<a aria-hidden="true" class="anchor" href="#%EB%A9%94%EC%8B%9C%EC%A7%80-%EB%94%94%EC%BD%94%EB%94%A9" id="user-content-메시지-디코딩"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>메시지 디코딩</h2>
<hr/>
<p>메시지 디코딩은 2단계에 걸쳐서 진행된다.</p>
<ul>
<li>메시지 복구에 필요한 2바이트의 길이 정보 디코딩</li>
<li>필요한 만큼의 비트 복구</li>
</ul>
<h3>
<a aria-hidden="true" class="anchor" href="#%EC%9D%B4%EB%AF%B8%EC%A7%80%EC%9D%98-%EC%A0%81%EC%83%89-%EC%B1%84%EB%84%90%EC%97%90%EC%84%9C-%EB%B9%84%ED%8A%B8%EB%93%A4%EC%9D%84-%EB%BD%91%EC%95%84%EC%98%A4%EB%8A%94-%EC%B6%94%EC%B6%9C%EA%B8%B0-%ED%95%A8%EC%88%98" id="user-content-이미지의-적색-채널에서-비트들을-뽑아오는-추출기-함수"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>이미지의 적색 채널에서 비트들을 뽑아오는 추출기 함수</h3>
<div class="highlight highlight-source-python"><pre><span class="pl-k">def</span> <span class="pl-en">get_bits</span>(<span class="pl-smi">image</span>, <span class="pl-smi">offset</span><span class="pl-k">=</span><span class="pl-c1">0</span>, <span class="pl-smi">size</span><span class="pl-k">=</span><span class="pl-c1">16</span>):
    width, height <span class="pl-k">=</span> image.size
    <span class="pl-k">for</span> pos <span class="pl-k">in</span> <span class="pl-c1">range</span>(offset, offset<span class="pl-k">+</span>size):
        y, x <span class="pl-k">=</span> <span class="pl-c1">divmod</span>(pos, width)
        r, g, b <span class="pl-k">=</span> image.getpixel((x,y))
        <span class="pl-c"><span class="pl-c">#</span> R값의 최하위 1비트 추출</span>
        <span class="pl-k">yield</span> r <span class="pl-k">&amp;</span> <span class="pl-c1"><span class="pl-k">0x</span>01</span></pre></div>
<h3>
<a aria-hidden="true" class="anchor" href="#%EB%B9%84%ED%8A%B8-%EA%B0%92%EC%9D%84-%EB%B0%94%EC%9D%B4%ED%8A%B8%EB%A1%9C-%EB%B0%94%EA%BE%B8%EC%96%B4-%EC%A3%BC%EB%8A%94-%ED%95%A8%EC%88%98%EB%93%A4" id="user-content-비트-값을-바이트로-바꾸어-주는-함수들"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>비트 값을 바이트로 바꾸어 주는 함수들</h3>
<div class="highlight highlight-source-python"><pre><span class="pl-c"><span class="pl-c">#</span>8-튜플에서 원래의 바이트를 복구</span>
<span class="pl-k">def</span> <span class="pl-en">to_byte</span>(<span class="pl-smi">bits</span>):
    byte <span class="pl-k">=</span> <span class="pl-c1">0</span>
    <span class="pl-k">for</span> bit <span class="pl-k">in</span> bits:
        byte <span class="pl-k">=</span> (byte<span class="pl-k">&lt;&lt;</span><span class="pl-c1">1</span>) <span class="pl-k">|</span> bit
    <span class="pl-k">return</span> byte


<span class="pl-c"><span class="pl-c">#</span>비트의 시퀀스를 8-튜플로 모으고 원래의 바이트 복구</span>
<span class="pl-k">def</span> <span class="pl-en">byte_sequence</span>(<span class="pl-smi">bits</span>):
    byte <span class="pl-k">=</span> []
    <span class="pl-k">for</span> idx, bit <span class="pl-k">in</span> <span class="pl-c1">enumerate</span>(bits):
        <span class="pl-c"><span class="pl-c">#</span>맨 첫비트 고려 후 8비트씩 끊기</span>
        <span class="pl-k">if</span> idx<span class="pl-k">%</span><span class="pl-c1">8</span> <span class="pl-k">==</span> <span class="pl-c1">0</span> <span class="pl-k">and</span> idx <span class="pl-k">!=</span> <span class="pl-c1">0</span>:
            <span class="pl-k">yield</span> to_byte(byte)
            byte <span class="pl-k">=</span> []
        byte.append(bit)
    <span class="pl-c"><span class="pl-c">#</span>맨 마지막 8비트를 바이트로</span>
    <span class="pl-k">yield</span> to_byte(byte)</pre></div>
<h3>
<a aria-hidden="true" class="anchor" href="#%EB%A9%94%EC%8B%9C%EC%A7%80-%EC%96%BB%EA%B8%B0" id="user-content-메시지-얻기"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z" fill-rule="evenodd"></path></svg></a>메시지 얻기</h3>
<div class="highlight highlight-source-python"><pre><span class="pl-c"><span class="pl-c">#</span>이미지 불러오기</span>
image <span class="pl-k">=</span> Image.open(<span class="pl-s"><span class="pl-pds">"</span>image.tiff<span class="pl-pds">"</span></span>)

<span class="pl-c"><span class="pl-c">#</span>메시지 크기 - 첫 2바이트</span>
size_h, size_l <span class="pl-k">=</span> byte_sequence(get_bits(image, <span class="pl-c1">0</span>, <span class="pl-c1">16</span>))
size <span class="pl-k">=</span> <span class="pl-c1">256</span><span class="pl-k">*</span>size_h <span class="pl-k">+</span> size_l

<span class="pl-c"><span class="pl-c">#</span>메시지</span>
message_byte_generator <span class="pl-k">=</span> byte_sequence(get_bits(image, <span class="pl-c1">16</span>, size<span class="pl-k">*</span><span class="pl-c1">8</span>))
message_get <span class="pl-k">=</span> <span class="pl-c1">bytes</span>(message_byte_generator).decode(<span class="pl-s"><span class="pl-pds">"</span>UTF-8<span class="pl-pds">"</span></span>)

<span class="pl-c1">print</span>(message_get)</pre></div>
<pre><code>hello, world
</code></pre>
<ul>
<li>다음과 같이 숨겨놓은 메시지를 확인할 수 있다.</li>
</ul>
</div>