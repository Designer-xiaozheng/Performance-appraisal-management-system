<template>
	<div class="diy_edit page_feedback_center" id="feedback_center_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row'>
					<div v-if="$check_field('set','feedback_title') || $check_field('add','feedback_title') || $check_field('get','feedback_title')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>反馈标题:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_feedback_title" v-model="form['feedback_title']" placeholder="请输入反馈标题" v-if="(form['feedback_title'] && $check_field('set','feedback_title')) || (!form['feedback_title'] && $check_field('add','feedback_title'))"  :disabled="disabledObj['feedback_title_isDisabled']"/>
							<span v-else-if="$check_field('get','feedback_title')">{{ form[''] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','feedback_type') || $check_field('add','feedback_type') || $check_field('get','feedback_type')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>反馈类型:
							</span>
						</div>
						<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_feedback_type" v-model="form['feedback_type']" v-if="(form['feedback_type'] && $check_field('set','feedback_type')) || (!form['feedback_type'] && $check_field('add','feedback_type'))" >
								<option v-for="o in list_feedback_type" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','feedback_type')">{{ form['feedback_type'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','feedback_time') || $check_field('add','feedback_time') || $check_field('get','feedback_time')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>反馈时间:
							</span>
						</div>
						<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['feedback_time_isDisabled']" id="form_feedback_time" v-model="form['feedback_time']" placeholder="请输入反馈时间" v-if="(form['feedback_time'] && $check_field('set','feedback_time')) || (!form['feedback_time'] && $check_field('add','feedback_time'))" />
							<span v-else-if="$check_field('get','feedback_time')">{{ form[''] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','owner_account_number') || $check_field('add','owner_account_number') || $check_field('get','owner_account_number')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>业主账号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_owner_account_number" :disabled="disabledObj['owner_account_number_isDisabled']" v-model="form['owner_account_number']" v-if="(form['owner_account_number'] && $check_field('set','owner_account_number')) || (!form['owner_account_number'] && $check_field('add','owner_account_number'))" >
								<option v-for="o in list_user_owner_account_number" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','owner_account_number')">{{ form['owner_account_number'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','feedback_content') || $check_field('add','feedback_content') || $check_field('get','feedback_content')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>反馈内容:
							</span>
						</div>
						<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_feedback_content" v-model="form['feedback_content']" v-if="(form['feedback_content'] && $check_field('set','feedback_content')) || (!form['feedback_content'] && $check_field('add','feedback_content'))" :disabled="disabledObj['feedback_content_isDisabled']" />
							<span v-else-if="$check_field('get','feedback_content')">{{ form[''] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','reply_content') || $check_field('add','reply_content') || $check_field('get','reply_content')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>回复内容:
							</span>
						</div>
						<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_reply_content" v-model="form['reply_content']" v-if="(form['reply_content'] && $check_field('set','reply_content')) || (!form['reply_content'] && $check_field('add','reply_content'))" :disabled="disabledObj['reply_content_isDisabled']" />
							<span v-else-if="$check_field('get','reply_content')">{{ form[''] }}</span>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/feedback_center/get_obj?",
				url_add: "~/api/feedback_center/add?",
				url_set: "~/api/feedback_center/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
					"feedback_title": "",
					"feedback_type": "",
					"feedback_time": "",
					"owner_account_number": 0,
					"feedback_content": "",
					"reply_content": "",
					"feedback_center_id": 0,
				},

				obj: {
					"feedback_title":'', // 反馈标题
					"feedback_type":'', // 反馈类型
					"feedback_time": "1970-01-01 00:00:00",
					"owner_account_number": 0, // 业主账号
					"feedback_content":'', // 反馈内容
					"reply_content":'', // 回复内容
					"feedback_center_id": 0,
				},

				// 表单字段
				form: {
					"feedback_title":'', // 反馈标题
					"feedback_type":'', // 反馈类型
					"feedback_time": "1970-01-01 00:00:00",
					"owner_account_number": 0, // 业主账号
					"feedback_content":'', // 反馈内容
					"reply_content":'', // 回复内容
					"feedback_center_id": 0,

				},
				disabledObj:{
					"feedback_title_isDisabled": false,
					"feedback_type_isDisabled": false,
					"feedback_time_isDisabled": false,
					"owner_account_number_isDisabled": false,
					"feedback_content_isDisabled": false,
					"reply_content_isDisabled": false,
				},
				//反馈类型选项列表
				list_feedback_type: ['建议','投诉'],
				// 用户列表
				list_user_owner_account_number: [],

				// ID字段
				field: "feedback_center_id",
			}
		},
		methods: {
			/**
			 * 获取业主用户列表
			 */
			async get_list_user_owner_account_number() {
				// if(this.user_group !== "管理员" && this.form["owner_account_number"] === 0) {
				//     this.form["owner_account_number"] = this.user.user_id;
				// }
				var json = await this.$get("~/api/user/get_list?user_group=业主");
				if(json.result && json.result.list){
					this.list_user_owner_account_number = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			async get_user_session_owner_account_number(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=业主");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["owner_account_number"] = user_id
								_this.disabledObj['owner_account_number' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
									for (var j=0;j<arrForm.length;j++){
										if (arr[i]===arrForm[j]){
											if (arr[i]!=="owner_account_number") {
												_this.form[arrForm[j]] = res.result.obj[arr[i]]
												_this.disabledObj[arrForm[j] + '_isDisabled'] = true
												break;
											}
										}
									}
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},

			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/feedback_center/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				if (form) {
					this.obj = $.push(this.obj ,form);
					this.form = $.push(this.form ,form);
				}
				var arr = []
				for (let key in form) {
					arr.push(key)
				}
				for (var i=0;i<arr.length;i++){
					this.disabledObj[arr[i] + '_isDisabled'] = true
				}
				this.form["feedback_time"] = this.$toTime(parseInt(this.form["feedback_time"]),"yyyy-MM-dd")
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				var form = $.db.get("form");
				var obj = Object.assign({} ,form ,this.obj);
				if (form) {
					this.obj = $.push(this.obj ,obj);
				}
				if (form) {
					this.form = $.push(this.form ,form);
				}
				if(func){
					func(json);
				}
			},

		},
		created() {
			this.get_user_session_owner_account_number();
			this.get_list_user_owner_account_number();
		}
	}
</script>

<style>
</style>
