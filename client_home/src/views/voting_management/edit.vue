<template>
	<div class="diy_edit page_voting_management" id="voting_management_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row'>
					<div v-if="$check_field('set','voting_title') || $check_field('add','voting_title') || $check_field('get','voting_title')" class="col-12 col-md-6">
						<div class="diy_title">
							<span> 投票标题:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_voting_title" v-model="form['voting_title']" placeholder="请输入 投票标题" v-if="(form['voting_title'] && $check_field('set','voting_title')) || (!form['voting_title'] && $check_field('add','voting_title'))"  :disabled="disabledObj['voting_title_isDisabled']"/>
							<span v-else-if="$check_field('get','voting_title')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','start_time') || $check_field('add','start_time') || $check_field('get','start_time')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>开始时间:
							</span>
						</div>
						<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['start_time_isDisabled']" id="form_start_time" v-model="form['start_time']" placeholder="请输入开始时间" v-if="(form['start_time'] && $check_field('set','start_time')) || (!form['start_time'] && $check_field('add','start_time'))" />
							<span v-else-if="$check_field('get','start_time')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','deadline') || $check_field('add','deadline') || $check_field('get','deadline')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>截止时间:
							</span>
						</div>
						<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['deadline_isDisabled']" id="form_deadline" v-model="form['deadline']" placeholder="请输入截止时间" v-if="(form['deadline'] && $check_field('set','deadline')) || (!form['deadline'] && $check_field('add','deadline'))" />
							<span v-else-if="$check_field('get','deadline')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','voting_status') || $check_field('add','voting_status') || $check_field('get','voting_status')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>表决状态:
							</span>
						</div>
						<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_voting_status" v-model="form['voting_status']" v-if="(form['voting_status'] && $check_field('set','voting_status')) || (!form['voting_status'] && $check_field('add','voting_status'))" >
								<option v-for="o in list_voting_status" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','voting_status')">{{ form['voting_status'] }}</span>
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
					<div v-if="$check_field('set','full_name') || $check_field('add','full_name') || $check_field('get','full_name')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>姓名:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_full_name" v-model="form['full_name']" placeholder="请输入姓名" v-if="(form['full_name'] && $check_field('set','full_name')) || (!form['full_name'] && $check_field('add','full_name'))"  :disabled="disabledObj['full_name_isDisabled']"/>
							<span v-else-if="$check_field('get','full_name')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','voting_time') || $check_field('add','voting_time') || $check_field('get','voting_time')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>投票时间:
							</span>
						</div>
						<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['voting_time_isDisabled']" id="form_voting_time" v-model="form['voting_time']" placeholder="请输入投票时间" v-if="(form['voting_time'] && $check_field('set','voting_time')) || (!form['voting_time'] && $check_field('add','voting_time'))" />
							<span v-else-if="$check_field('get','voting_time')">{{ form['full_name'] }}</span>
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
				url_get_obj: "~/api/voting_management/get_obj?",
				url_add: "~/api/voting_management/add?",
				url_set: "~/api/voting_management/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
					"voting_title": "",
					"start_time": "",
					"deadline": "",
					"voting_status": "",
					"owner_account_number": 0,
					"full_name": "",
					"voting_time": "",
					"voting_management_id": 0,
				},

				obj: {
					"voting_title":'', //  投票标题
					"start_time": "1970-01-01 00:00:00",
					"deadline": "1970-01-01 00:00:00",
					"voting_status":'', // 表决状态
					"owner_account_number": 0, // 业主账号
					"full_name":'', // 姓名
					"voting_time": "1970-01-01 00:00:00",
					"voting_management_id": 0,
				},

				// 表单字段
				form: {
					"voting_title":'', //  投票标题
					"start_time": "1970-01-01 00:00:00",
					"deadline": "1970-01-01 00:00:00",
					"voting_status":'', // 表决状态
					"owner_account_number": 0, // 业主账号
					"full_name":'', // 姓名
					"voting_time": "1970-01-01 00:00:00",
					"voting_management_id": 0,

				},
				disabledObj:{
					"voting_title_isDisabled": false,
					"start_time_isDisabled": false,
					"deadline_isDisabled": false,
					"voting_status_isDisabled": false,
					"owner_account_number_isDisabled": false,
					"full_name_isDisabled": false,
					"voting_time_isDisabled": false,
				},
				//表决状态选项列表
				list_voting_status: ['支持','反对'],
				// 用户列表
				list_user_owner_account_number: [],

				// ID字段
				field: "voting_management_id",
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
				this.$post("~/api/voting_management/upload?", form, (res) => {
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
				this.form["start_time"] = this.$toTime(parseInt(this.form["start_time"]),"yyyy-MM-dd")
				this.form["deadline"] = this.$toTime(parseInt(this.form["deadline"]),"yyyy-MM-dd")
				this.form["voting_time"] = this.$toTime(parseInt(this.form["voting_time"]),"yyyy-MM-dd")
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
