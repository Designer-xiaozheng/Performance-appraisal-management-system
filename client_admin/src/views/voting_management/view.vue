<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','voting_title') || $check_field('add','voting_title') || $check_field('set','voting_title')" :xs="24" :sm="12" :lg="8">
				<el-form-item label=" 投票标题" prop="voting_title">
					<el-input id="voting_title" v-model="form['voting_title']" placeholder="请输入 投票标题"
							  v-if="user_group === '管理员' || (form['voting_management_id'] && $check_field('set','voting_title')) || (!form['voting_management_id'] && $check_field('add','voting_title'))" :disabled="disabledObj['voting_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','voting_title')">{{form['voting_title']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','start_time') || $check_field('add','start_time') || $check_field('set','start_time')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="开始时间" prop="start_time">
					<el-date-picker :disabled="disabledObj['start_time_isDisabled']" v-if="user_group === '管理员' || (form['voting_management_id'] && $check_field('set','start_time')) || (!form['voting_management_id'] && $check_field('add','start_time'))" id="start_time"
						v-model="form['start_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','start_time')">{{form['start_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','deadline') || $check_field('add','deadline') || $check_field('set','deadline')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="截止时间" prop="deadline">
					<el-date-picker :disabled="disabledObj['deadline_isDisabled']" v-if="user_group === '管理员' || (form['voting_management_id'] && $check_field('set','deadline')) || (!form['voting_management_id'] && $check_field('add','deadline'))" id="deadline"
						v-model="form['deadline']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','deadline')">{{form['deadline']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','voting_status') || $check_field('add','voting_status') || $check_field('set','voting_status')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="表决状态" prop="voting_status">
					<el-select id="voting_status" v-model="form['voting_status']"
						v-if="user_group === '管理员' || (form['voting_management_id'] && $check_field('set','voting_status')) || (!form['voting_management_id'] && $check_field('add','voting_status'))">
						<el-option v-for="o in list_voting_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','voting_status')">{{form['voting_status']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','owner_account_number') || $check_field('add','owner_account_number') || $check_field('set','owner_account_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="业主账号" prop="owner_account_number">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_owner_account_number(form['owner_account_number']) }}
							<!--<el-input id="business_name" v-model="form['owner_account_number']" placeholder="请输入业主账号"-->
							<!--v-if="user_group === '管理员' || (form['voting_management_id'] && $check_field('set','owner_account_number')) || (!form['voting_management_id'] && $check_field('add','owner_account_number'))" :disabled="disabledObj['owner_account_number_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','owner_account_number')">{{form['owner_account_number']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['voting_management_id'] && $check_field('set','owner_account_number')) || (!form['voting_management_id'] && $check_field('add','owner_account_number'))" id="owner_account_number" v-model="form['owner_account_number']" :disabled="disabledObj['owner_account_number_isDisabled']">
								<el-option v-for="o in list_user_owner_account_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','owner_account_number')" id="owner_account_number" v-model="form['owner_account_number']" :disabled="true">
								<el-option v-for="o in list_user_owner_account_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="owner_account_number" v-model="form['owner_account_number']" :disabled="disabledObj['owner_account_number_isDisabled']">
							<el-option v-for="o in list_user_owner_account_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','full_name') || $check_field('add','full_name') || $check_field('set','full_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="姓名" prop="full_name">
					<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"
							  v-if="user_group === '管理员' || (form['voting_management_id'] && $check_field('set','full_name')) || (!form['voting_management_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','voting_time') || $check_field('add','voting_time') || $check_field('set','voting_time')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="投票时间" prop="voting_time">
					<el-date-picker :disabled="disabledObj['voting_time_isDisabled']" v-if="user_group === '管理员' || (form['voting_management_id'] && $check_field('set','voting_time')) || (!form['voting_management_id'] && $check_field('add','voting_time'))" id="voting_time"
						v-model="form['voting_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','voting_time')">{{form['voting_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "voting_management_id",
				url_add: "~/api/voting_management/add?",
				url_set: "~/api/voting_management/set?",
				url_get_obj: "~/api/voting_management/get_obj?",
				url_upload: "~/api/voting_management/upload?",

				query: {
					"voting_management_id": 0,
				},

				form: {
					"voting_title":'', //  投票标题
					"start_time":'', // 开始时间
					"deadline":'', // 截止时间
					"voting_status":'', // 表决状态
					"owner_account_number": 0, // 业主账号
					"full_name":'', // 姓名
					"voting_time":'', // 投票时间
					"voting_management_id": 0, // ID

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
				// 用户组
				group_user_owner_account_number: "",

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
			/**
			 * 获取业主用户组
			 */
			async get_group_user_owner_account_number() {
				this.form["owner_account_number"] = this.user.user_id;
				var json = await this.$get("~/api/user_group/get_obj?name=业主");
				if(json.result && json.result.obj){
					this.group_user_owner_account_number = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_owner_account_number(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_owner_account_number.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
						for (let key in _this.form) {
							arrForm.push(key)
						}
						for (var i=0;i<arr.length;i++){
							for (var j=0;j<arrForm.length;j++){
								if (arr[i]===arrForm[j]){
									if (arr[i]!=="owner_account_number") {
										_this.form[arrForm[j]] = res.result.obj[arr[i]]
										_this.disabledObj[arrForm[j] + '_isDisabled'] = true
										break;
									}else {
										_this.disabledObj[arrForm[j] + '_isDisabled'] = true
									}
								}
							}
						}
					}
				});
			},
			get_user_owner_account_number(id){
				var obj = this.list_user_owner_account_number.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
				// 获取缓存数据附加
				form = $.db.get("form");
				$.push(this.form ,form);
				/**
				* 请求列表前
				* @param {Object} param
				*/
				var user_group = this.user.user_group;
				if (user_group !== "管理员") {
					switch (user_group) {
						case "业主账号":
							if(param["owner_account_number"] > 0){
								param["owner_account_number"] = this.user.user_id;
							}
							break;
					}
				}
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							if(dbKey === "charging_standard"){
								this.form['charging_rules'] = form[dbKey];
								this.disabledObj['charging_rules_isDisabled'] = true;
							};
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
				this.form["start_time"] = this.$toTime(parseInt(this.form["start_time"]),"yyyy-MM-dd")
				this.form["deadline"] = this.$toTime(parseInt(this.form["deadline"]),"yyyy-MM-dd")
				this.form["voting_time"] = this.$toTime(parseInt(this.form["voting_time"]),"yyyy-MM-dd")
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
				if(parseInt(this.form["start_time"]) > 9999){
					this.form["start_time"] = this.$toTime(parseInt(this.form["start_time"]),"yyyy-MM-dd")
				}
				if(parseInt(this.form["deadline"]) > 9999){
					this.form["deadline"] = this.$toTime(parseInt(this.form["deadline"]),"yyyy-MM-dd")
				}
				if(parseInt(this.form["voting_time"]) > 9999){
					this.form["voting_time"] = this.$toTime(parseInt(this.form["voting_time"]),"yyyy-MM-dd")
				}

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/voting_management/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/voting_management/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/voting_management/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/voting_management/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/voting_management/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
			this.get_list_user_owner_account_number();
			this.get_group_user_owner_account_number();
		}
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
