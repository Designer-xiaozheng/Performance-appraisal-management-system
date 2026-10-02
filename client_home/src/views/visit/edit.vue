<template>
	<div class="diy_edit page_visit" id="visit_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row'>
					<div v-if="$check_field('set','visiting_account') || $check_field('add','visiting_account') || $check_field('get','visiting_account')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>来访账号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_visiting_account" :disabled="disabledObj['visiting_account_isDisabled']" v-model="form['visiting_account']" v-if="(form['visiting_account'] && $check_field('set','visiting_account')) || (!form['visiting_account'] && $check_field('add','visiting_account'))" >
								<option v-for="o in list_user_visiting_account" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','visiting_account')">{{ form['visiting_account'] }}</span>
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
					<div v-if="$check_field('set','visit_the_owner') || $check_field('add','visit_the_owner') || $check_field('get','visit_the_owner')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>探访业主:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_visit_the_owner" :disabled="disabledObj['visit_the_owner_isDisabled']" v-model="form['visit_the_owner']" v-if="(form['visit_the_owner'] && $check_field('set','visit_the_owner')) || (!form['visit_the_owner'] && $check_field('add','visit_the_owner'))" >
								<option v-for="o in list_user_visit_the_owner" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','visit_the_owner')">{{ form['visit_the_owner'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','name_of_owner') || $check_field('add','name_of_owner') || $check_field('get','name_of_owner')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>业主姓名:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_name_of_owner" v-model="form['name_of_owner']" placeholder="请输入业主姓名" v-if="(form['name_of_owner'] && $check_field('set','name_of_owner')) || (!form['name_of_owner'] && $check_field('add','name_of_owner'))"  :disabled="disabledObj['name_of_owner_isDisabled']"/>
							<span v-else-if="$check_field('get','name_of_owner')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','building_no') || $check_field('add','building_no') || $check_field('get','building_no')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>楼栋号:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_building_no" v-model="form['building_no']" placeholder="请输入楼栋号" v-if="(form['building_no'] && $check_field('set','building_no')) || (!form['building_no'] && $check_field('add','building_no'))"  :disabled="disabledObj['building_no_isDisabled']"/>
							<span v-else-if="$check_field('get','building_no')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','house_number') || $check_field('add','house_number') || $check_field('get','house_number')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>门牌号:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_house_number" v-model="form['house_number']" placeholder="请输入门牌号" v-if="(form['house_number'] && $check_field('set','house_number')) || (!form['house_number'] && $check_field('add','house_number'))"  :disabled="disabledObj['house_number_isDisabled']"/>
							<span v-else-if="$check_field('get','house_number')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','owner_confirmation_status') || $check_field('add','owner_confirmation_status') || $check_field('get','owner_confirmation_status')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>业主确认状态:
							</span>
						</div>
						<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_owner_confirmation_status" v-model="form['owner_confirmation_status']" v-if="(form['owner_confirmation_status'] && $check_field('set','owner_confirmation_status')) || (!form['owner_confirmation_status'] && $check_field('add','owner_confirmation_status'))" >
								<option v-for="o in list_owner_confirmation_status" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','owner_confirmation_status')">{{ form['owner_confirmation_status'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','reason_for_visit') || $check_field('add','reason_for_visit') || $check_field('get','reason_for_visit')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>来访原因:
							</span>
						</div>
						<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_reason_for_visit" v-model="form['reason_for_visit']" v-if="(form['reason_for_visit'] && $check_field('set','reason_for_visit')) || (!form['reason_for_visit'] && $check_field('add','reason_for_visit'))" :disabled="disabledObj['reason_for_visit_isDisabled']" />
							<span v-else-if="$check_field('get','reason_for_visit')">{{ form['full_name'] }}</span>
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
				url_get_obj: "~/api/visit/get_obj?",
				url_add: "~/api/visit/add?",
				url_set: "~/api/visit/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
					"visiting_account": 0,
					"full_name": "",
					"visit_the_owner": 0,
					"name_of_owner": "",
					"building_no": "",
					"house_number": "",
					"owner_confirmation_status": "",
					"reason_for_visit": "",
					"visit_id": 0,
				},

				obj: {
					"visiting_account": 0, // 来访账号
					"full_name":'', // 姓名
					"visit_the_owner": 0, // 探访业主
					"name_of_owner":'', // 业主姓名
					"building_no":'', // 楼栋号
					"house_number":'', // 门牌号
					"owner_confirmation_status":'', // 业主确认状态
					"reason_for_visit":'', // 来访原因
					"visit_id": 0,
				},

				// 表单字段
				form: {
					"visiting_account": 0, // 来访账号
					"full_name":'', // 姓名
					"visit_the_owner": 0, // 探访业主
					"name_of_owner":'', // 业主姓名
					"building_no":'', // 楼栋号
					"house_number":'', // 门牌号
					"owner_confirmation_status":'', // 业主确认状态
					"reason_for_visit":'', // 来访原因
					"visit_id": 0,

				},
				disabledObj:{
					"visiting_account_isDisabled": false,
					"full_name_isDisabled": false,
					"visit_the_owner_isDisabled": false,
					"name_of_owner_isDisabled": false,
					"building_no_isDisabled": false,
					"house_number_isDisabled": false,
					"owner_confirmation_status_isDisabled": false,
					"reason_for_visit_isDisabled": false,
				},
				// 用户列表
				list_user_visiting_account: [],
				// 用户列表
				list_user_visit_the_owner: [],
				//业主确认状态选项列表
				list_owner_confirmation_status: ['已确认','已否定'],

				// ID字段
				field: "visit_id",
			}
		},
		methods: {
			/**
			 * 获取访客用户列表
			 */
			async get_list_user_visiting_account() {
				// if(this.user_group !== "管理员" && this.form["visiting_account"] === 0) {
				//     this.form["visiting_account"] = this.user.user_id;
				// }
				var json = await this.$get("~/api/user/get_list?user_group=访客");
				if(json.result && json.result.list){
					this.list_user_visiting_account = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			async get_user_session_visiting_account(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=访客");
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
								_this.form["visiting_account"] = user_id
								_this.disabledObj['visiting_account' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
									for (var j=0;j<arrForm.length;j++){
										if (arr[i]===arrForm[j]){
											if (arr[i]!=="visiting_account") {
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
			 * 获取业主用户列表
			 */
			async get_list_user_visit_the_owner() {
				// if(this.user_group !== "管理员" && this.form["visit_the_owner"] === 0) {
				//     this.form["visit_the_owner"] = this.user.user_id;
				// }
				var json = await this.$get("~/api/user/get_list?user_group=业主");
				if(json.result && json.result.list){
					this.list_user_visit_the_owner = json.result.list;
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
				this.$post("~/api/visit/upload?", form, (res) => {
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
			this.get_user_session_visiting_account();
			this.get_list_user_visiting_account();
			this.get_list_user_visit_the_owner();
		}
	}
</script>

<style>
</style>
